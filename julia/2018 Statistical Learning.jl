using JuMP, Clp
include("NetworkReference.jl")
data_file = string("/pglib-opf-17.08/pglib_opf_case30_ieee.m")

# ref = OPFRecourse.NetworkReference(data_file, bus_prob = 0.95, line_prob = 0.95, σscaling = 0.05);