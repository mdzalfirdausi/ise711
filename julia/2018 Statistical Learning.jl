using JuMP
import Clarabel
import DataFrames
import Ipopt
import LinearAlgebra
import SparseArrays
import Test

N = 9;
# Real generation: lower (`lb`) and upper (`ub`) bounds
P_Gen_lb = SparseArrays.sparsevec([1, 2, 3], [10, 10, 10], N)
P_Gen_ub = SparseArrays.sparsevec([1, 2, 3], [250, 300, 270], N)
# Reactive generation: lower (`lb`) and upper (`ub`) bounds
Q_Gen_lb = SparseArrays.sparsevec([1, 2, 3], [-5, -5, -5], N)
Q_Gen_ub = SparseArrays.sparsevec([1, 2, 3], [300, 300, 300], N)
# Power demand levels (real, reactive, and complex form)
P_Demand = SparseArrays.sparsevec([5, 7, 9], [54, 60, 75], N)
Q_Demand = SparseArrays.sparsevec([5, 7, 9], [18, 21, 30], N)
S_Demand = P_Demand + im * Q_Demand

model = Model(Ipopt.Optimizer)
set_silent(model)
@variable(model, P_Gen_lb[i] <= P_G[i in 1:N] <= P_Gen_ub[i])
@objective(
    model,
    Min,
    (0.11 * P_G[1]^2 + 5 * P_G[1] + 150) +
    (0.085 * P_G[2]^2 + 1.2 * P_G[2] + 600) +
    (0.1225 * P_G[3]^2 + P_G[3] + 335),
);
basic_lower_bound = value(lower_bound, objective_function(model));
@constraint(model, sum(P_G) >= sum(P_Demand))
optimize!(model)
assert_is_solved_and_feasible(model)
better_lower_bound = round(objective_value(model); digits = 2)
# println("Objective value (better lower bound): $better_lower_bound")
branch_data = DataFrames.DataFrame([
    (1, 4, 0.0, 0.0576, 0.0),
    (4, 5, 0.017, 0.092, 0.158),
    (6, 5, 0.039, 0.17, 0.358),
    (3, 6, 0.0, 0.0586, 0.0),
    (6, 7, 0.0119, 0.1008, 0.209),
    (8, 7, 0.0085, 0.072, 0.149),
    (2, 8, 0.0, 0.0625, 0.0),
    (8, 9, 0.032, 0.161, 0.306),
    (4, 9, 0.01, 0.085, 0.176),
]);
DataFrames.rename!(branch_data, [:F_BUS, :T_BUS, :BR_R, :BR_X, :BR_Bc])
base_MVA = 100;
M = size(branch_data, 1)
A =
    SparseArrays.sparse(branch_data.F_BUS, 1:M, 1, N, M) +
    SparseArrays.sparse(branch_data.T_BUS, 1:M, -1, N, M)
z = (branch_data.BR_R .+ im * branch_data.BR_X) / base_MVA #  impedance vector
Y_0 = A * SparseArrays.spdiagm(1 ./ z) * A' #  bus admittance matrix 
y_sh = 1 / 2 * (im * branch_data.BR_Bc) * base_MVA # branch line-charging susceptance
Y_sh = SparseArrays.spdiagm(
    LinearAlgebra.diag(A * SparseArrays.spdiagm(y_sh) * A'),
); #shunt admittance matrix

Y = Y_0 + Y_sh

model = Model(Ipopt.Optimizer)
set_silent(model)
@variable(
    model,
    S_G[i in 1:N] in ComplexPlane(),
    lower_bound = P_Gen_lb[i] + Q_Gen_lb[i] * im,
    upper_bound = P_Gen_ub[i] + Q_Gen_ub[i] * im,
) # nodal power generation variable

