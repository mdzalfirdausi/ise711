class Bus:
    def __init__(self, pd, gs, gens):
        self.pd = pd
        self.gs = gs
        self.gens = gens
class Gen:
    def __init__(self, bus, pmin, pmax, pstart, cost):
        self.bus = bus
        self.pmin = pmin
        self.pmax = pmax
        self.pstart = pstart
        self.cost = cost
class Line:
    def __init__(self, rate, frombus, tobus, one_over_reactance):
        self.rate = rate
        self.frombus = frombus
        self.tobus = tobus
        self.one_over_reactance = one_over_reactance # β beta
class NetworkReference:
    def __init__(self, ref, nbus, ngen, nline, r, bus, gen, line, originalindices, B, pi, stdw, line_prob=0.9, bus_prob=0.9):
        self.ref = ref # Dictionary of ref data
        self.nbus = nbus
        self.ngen = ngen
        self.nline = nline
        self.r = r  # Reference bus index
        self.bus = bus # list of bus
        self.gen = gen  
        self.line = line 
        self.originalindices = originalindices 
        self.B = B  # Admittance matrix
        self.pi = pi  # Inverse reduced admittance matrix
        self.stdw = stdw  # List of standard deviations
        self.line_prob = line_prob 
        self.bus_prob = bus_prob  