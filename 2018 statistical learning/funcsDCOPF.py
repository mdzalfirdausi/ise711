from matpowercaseframes import CaseFrames
from numpy.linalg import inv
from collections import defaultdict

def cost(ref,p):
    return gp.quicksum(ref.gen[g].cost[0]*p[g] + ref.gen[g].cost[1]*p[g] + ref.gen[g].cost[2] for g in range(len(ref.gen)))
def networkreference(data_file, line_prob=0.9, bus_prob=0.9, sigma_scaling=0.05):
    mpc = CaseFrames(data_file)
    ref = {attr: getattr(mpc,attr) for attr in mpc.attributes}
    
    def admittancematrix(ref, bus_index):
        nbus = len(ref['bus'])
        B = np.zeros((nbus,nbus))
        bus_index_inv= {v:k for k,v in bus_index.items()}
        nline = len(ref['branch'])
        for br in range(nline):
            f_bus = bus_index_inv[ref['branch'].F_BUS.values[br]]
            t_bus = bus_index_inv[ref['branch'].T_BUS.values[br]]
            susceptance = ref['branch'].BR_X.values[br]/(ref['branch'].BR_X.values[br]**2+ref['branch'].BR_R.values[br]**2) # imaginary part of admittance, x/(x^2+r^2)
            B[f_bus-1, t_bus-1] += -susceptance
            B[t_bus-1, f_bus-1] += -susceptance
            B[f_bus-1, f_bus-1] += susceptance
            B[t_bus-1, t_bus-1] += susceptance
        return B, bus_index_inv
    def generateindices(d):
        df = d.sort_values(by=d.columns[0]).reset_index(drop=True)
        originalindices = df.index+1
        nindices = len(originalindices)
        index_to_busID = dict(zip(originalindices,df[df.columns[0]])) # keys are unique, but busID at gen may not unique since there may more than one generation are connected to a single bus
        return nindices, originalindices, index_to_busID
        
    ngen, genindices, gen_index = generateindices(ref['gen'])
    bus_gens = defaultdict(list)
    for num, bus in enumerate(ref['bus'].BUS_I):
        if not bus in gen_index.values():
            bus_gens[bus] = []
        else:
            for num2, val in enumerate(gen_index.values()):
                if bus == val:
                    bus_gens[bus].append(list(gen_index.keys())[num2])
    gen = [Gen(
        ref['gen'].GEN_BUS.values[i],
        ref['gen'].PMIN.values[i],
        ref['gen'].PMAX.values[i],
        ref['gen'].PG.values[i],
        ref['gencost'][['COST_2','COST_1','COST_0']].values
        ) for i in range(ngen)]
    nbus, busindices, bus_index = generateindices(ref['bus'])
    bus = [Bus(
        ref['bus'].PD.values[i],
        ref['bus'].GS.values[i],
        bus_gens[bus_index[i+1]] ,
        ) for i in range(nbus)]
    nline, lineindices, fbus_index =generateindices(ref['branch'])
    line = [Line(
            ref['branch'].RATE_A.values[l],
            ref['branch'].F_BUS.values[l],
            ref['branch'].T_BUS.values[l],
            1/ ref['branch'].BR_X.values[l]
            ) for l in range(nline)]
    originalindices = {'bus':busindices, 'gen':genindices, 'line':lineindices}
    ref['ref_buses'] = ref['bus'][ref['bus'].BUS_TYPE==3]
    r = ref['ref_buses'].index[0]-1 # since the index of bus starting from 1
    nonref_indices = [b for b in range(nbus) if b != r]
    B, bus_index_inv = admittancematrix(ref, bus_index)
    pi = np.zeros((nbus,nbus))
    pi[np.ix_(nonref_indices,nonref_indices)] = inv(B[np.ix_(nonref_indices,nonref_indices)])
    stdw = [sigma_scaling*ref['bus'].PD.values[b] for b in range(nbus)]
    return NetworkReference(ref,nbus,ngen,nline,r,bus,gen,line,originalindices,B,pi,stdw,line_prob,bus_prob)
        