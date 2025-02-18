########
# Sets #
########

set N;
set H ordered;

##############
# Parameters #
##############

# Reservoir volumes
param initial_volume;
param minimum_volume;
param maximum_volume;

param profit{H};
param inflow{H};

# Turbine attributes
param minimum_production{N};
param maximum_production{N};
param minimum_discharge{N};
param maximum_discharge{N};
param efficiency{N};

param a_head;
param a_tail_q;
param a_tail_s;
param b_head;
param b_tail;

#############
# Variables #
#############

var x{N, H} binary;
var q{N, H} >= 0;
var p{N, H} >= 0;
var qtot{H} >= 0;
var s{H} >= 0;
var v{H} >= minimum_volume, <= maximum_volume;
var h_head{H};
var h_tail{H};
var h_net{H} >= 0;

#############
# Objective #
#############

# Objective: Maximize total profit
maximize total_profit:
    sum {t in H, j in N} profit[t] * p[j,t];

###############
# Constraints #
###############

# Constraints: water balance.
subject to water_balance_rule {t in H: ord(t) > 1}:
    v[t] = v[t-1] + 3600 * inflow[t] - 3600 * qtot[t] - 3600 * s[t];

# Constraints: minimum production
subject to minimum_production_rule {t in H, j in N}:
    p[j,t] >= minimum_production[j] * x[j,t];

# Constraints: maximum production
subject to maximum_production_rule {t in H, j in N}:
    p[j,t] <= maximum_production[j] * x[j,t];

# Constraints: minimum discharge
subject to minimum_discharge_rule {t in H, j in N}:
    q[j,t] >= minimum_discharge[j] * x[j,t];

# Constraints: maximum discharge
subject to maximum_discharge_rule {t in H, j in N}:
    q[j,t] <= maximum_discharge[j] * x[j,t];

# Constraints: total water discharge.
subject to total_water_discharge_rule {t in H}:
    qtot[t] = sum {j in N} q[j,t];

# Constraints: headwater
subject to headwater_rule {t in H}:
    h_head[t] = a_head * v[t] + b_head;

# Constraints: tailwater
subject to tailwater_rule {t in H}:
    h_tail[t] = a_tail_q * qtot[t] + a_tail_s * s[t] + b_tail;

# Constraints: nethead
subject to nethead_rule {t in H}:
    h_net[t] = h_head[t] - h_tail[t];

# Constraints: hydropower production function
subject to hydropower_production_rule {t in H, j in N}:
    p[j,t] = efficiency[j] * q[j,t] * h_net[t];

# Constraints: initial conditions.
subject to initial_volume_condition:
    v[first(H)] = initial_volume;
subject to final_volume_condition:
    v[last(H)] >= initial_volume;
subject to initial_spilled_water_condition:
    s[first(H)] = 0;
subject to initial_discharge_condition {j in N}:
    q[j, first(H)] = 0;
