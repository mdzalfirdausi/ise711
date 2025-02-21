using JuMP, Gurobi, LinearAlgebra, SparseArrays, Distributions
using DataStructures
include("reference.jl")

# Load case data
mpc_file = "pglib-opf-17.08/pglib_opf_case300_ieee.m"
mpc = PowerModels.parse_file(mpc_file)


# # Extract data
baseMVA = mpc["baseMVA"]
bus = OrderedDict(mpc["bus"])
branch = mpc["branch"]
gen = mpc["gen"]

bus_index_dict = Dict(bus[i] => k for i, (k,v) in enumerate(bus))


# Create bus index mapping
# bus_index_dict = Dict(bus[i, 1] => i for i in 1:size(bus, 1))

# # Reindex buses, branches, and generators
# bus[:, 1] .= [bus_index_dict[b] for b in bus[:, 1]]
# branch[:, 1] .= [bus_index_dict[b] for b in branch[:, 1]]
# branch[:, 2] .= [bus_index_dict[b] for b in branch[:, 2]]
# gen[:, 1] .= [bus_index_dict[g] for g in gen[:, 1]]

# gen_index = Int.(gen[:, 1])
# bus_index = Int.(bus[:, 1])
# gen_lb = gen[:, "PMIN"]
# gen_ub = gen[:, "PMAX"]
# num_samples = 1
# nbus = size(bus, 1)
# nline = size(branch, 1)
# cost_coeff = hcat(gen[:, "COST_2"], gen[:, "COST_1"], gen[:, "COST_0"])

# # Construct incidence matrix H
# H = spzeros(Int, nbus, length(gen_index))
# for (col, gen_bus) in enumerate(gen_index)
#     H[gen_bus, col] = 1
# end

# # Compute PTDF matrix
# M = makePTDF(baseMVA, bus, branch)
# f_max = branch[:, 6]
# p_init = gen[:, "PG"]
# d = bus[:, "PD"]

# sigma_scaling = 0.03
# nonzero_indices = findall(d .!= 0)
# d_nonzeros = d[nonzero_indices]
# sigma = sigma_scaling .* d_nonzeros
# omega_dist = MvNormal(zeros(length(d_nonzeros)), Diagonal(sigma.^2))
# omega_samples = rand(omega_dist, num_samples)
# omega = zeros(num_samples, nbus)
# omega[:, nonzero_indices] .= omega_samples

# # JuMP Model
# model = Model(Mosek.Optimizer)

# # Variables
# @variable(model, gen_lb[g] <= p[g in 1:length(gen_index)] <= gen_ub[g], start=p_init[g])

# # Parameters
# @parameter(model, omega[b in 1:nbus], omega[1, b])

# # Objective Function
# @objective(model, Min, sum(cost_coeff[g, 1] * p[g] for g in 1:length(gen_index)) +
#                         sum(cost_coeff[g, 2] * p[g] for g in 1:length(gen_index)) +
#                         sum(cost_coeff[:, 3]))

# # Power balance constraint
# @constraint(model, sum(p) == sum(d) - sum(omega))

# # Transmission line constraints
# flow_expr = M * (H * p + omega - d)
# @constraint(model, -f_max .<= flow_expr .<= f_max)

# # Solve Model
# solver = optimizer_with_attributes(Mosek.Optimizer)
# infeasible = 0
# bases_dict = Dict()
# bases_set = Set()

# for i in 1:num_samples
#     for j in 1:nbus
#         set_value(omega[j], omega[i, j])
#     end
#     res = optimize!(model)
#     if termination_status(model) != MOI.OPTIMAL
#         infeasible += 1
#     end
# end
