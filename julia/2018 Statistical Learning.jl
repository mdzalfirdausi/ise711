# using PowerModels, Ipopt
# result = solve_dc_opf("pglib-opf-17.08/pglib_opf_case30_ieee.m", Ipopt.Optimizer)
filename =  "pglib-opf-17.08/pglib_opf_case1951_rte.m"
network_data = PowerModels.parse_file(filename)
result = solve_dc_opf(network_data, Ipopt.Optimizer)

result["objective"]
# ref = PowerModels.build_ref(PowerModels.parse_file(filename))[:nw][0];
# ref = PowerModels.build_ref(PowerModels.parse_file(filename))

# ref[:it][:pm][:nw][0]
# result["solve_time"] 2.9539999961853027 dc: 0.0869999

network_data["gen"]["3"]["cost"]