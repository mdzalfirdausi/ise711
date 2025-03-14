\* Source Pyomo model name=unknown *\

min 
min_gen_cost:
+2000.0 bus_gen_ss(0)
+2000.0 bus_gen_ss(1)
+4000.0 bus_gen_ss(2)
+4000.0 bus_gen_ss(5)
+4000.0 bus_gen_ss(7)
+ [
+860.585198 bus_gen_ss(0) ^ 2
+5000.0 bus_gen_ss(1) ^ 2
+200.0 bus_gen_ss(2) ^ 2
+200.0 bus_gen_ss(5) ^ 2
+200.0 bus_gen_ss(7) ^ 2
] / 2

s.t.

c_e_power_balance(1)_:
+1 bus_gen_ss(0)
-1 Pij_ss(0)
-1 Pij_ss(1)
= 0.0

c_e_power_balance(2)_:
+1 bus_gen_ss(1)
+1 Pij_ss(0)
-1 Pij_ss(2)
-1 Pij_ss(3)
-1 Pij_ss(4)
= 0.217

c_e_power_balance(3)_:
+1 bus_gen_ss(2)
+1 Pij_ss(2)
-1 Pij_ss(5)
= 0.9420000000000001

c_e_power_balance(4)_:
+1 Pij_ss(3)
+1 Pij_ss(5)
-1 Pij_ss(6)
-1 Pij_ss(7)
-1 Pij_ss(8)
= 0.478

c_e_power_balance(5)_:
+1 Pij_ss(1)
+1 Pij_ss(4)
+1 Pij_ss(6)
-1 Pij_ss(9)
= 0.076

c_e_power_balance(6)_:
+1 bus_gen_ss(5)
+1 Pij_ss(9)
-1 Pij_ss(10)
-1 Pij_ss(11)
-1 Pij_ss(12)
= 0.11199999999999999

c_e_power_balance(7)_:
+1 Pij_ss(7)
-1 Pij_ss(13)
-1 Pij_ss(14)
= 0.0

c_e_power_balance(8)_:
+1 bus_gen_ss(7)
+1 Pij_ss(13)
= 0.0

c_e_power_balance(9)_:
+1 Pij_ss(8)
+1 Pij_ss(14)
-1 Pij_ss(15)
-1 Pij_ss(16)
= 0.295

c_e_power_balance(10)_:
+1 Pij_ss(15)
-1 Pij_ss(17)
= 0.09

c_e_power_balance(11)_:
+1 Pij_ss(10)
+1 Pij_ss(17)
= 0.035

c_e_power_balance(12)_:
+1 Pij_ss(11)
-1 Pij_ss(18)
= 0.061

c_e_power_balance(13)_:
+1 Pij_ss(12)
+1 Pij_ss(18)
-1 Pij_ss(19)
= 0.135

c_e_power_balance(14)_:
+1 Pij_ss(16)
+1 Pij_ss(19)
= 0.149

c_u_gen_limit(1)_:
+1 bus_gen_ss(0)
<= 3.324

c_l_gen_limit(2)_:
+1 bus_gen_ss(0)
>= 0.0

c_u_gen_limit(3)_:
+1 bus_gen_ss(1)
<= 1.4

c_l_gen_limit(4)_:
+1 bus_gen_ss(1)
>= 0.0

c_u_gen_limit(5)_:
+1 bus_gen_ss(2)
<= 1.0

c_l_gen_limit(6)_:
+1 bus_gen_ss(2)
>= 0.0

c_u_gen_limit(7)_:
+1 bus_gen_ss(5)
<= 1.0

c_l_gen_limit(8)_:
+1 bus_gen_ss(5)
>= 0.0

c_u_gen_limit(9)_:
+1 bus_gen_ss(7)
<= 1.0

c_l_gen_limit(10)_:
+1 bus_gen_ss(7)
>= 0.0

c_e_gen_limit(11)_:
+1 bus_gen_ss(3)
= 0

c_e_gen_limit(12)_:
+1 bus_gen_ss(4)
= 0

c_e_gen_limit(13)_:
+1 bus_gen_ss(6)
= 0

c_e_gen_limit(14)_:
+1 bus_gen_ss(8)
= 0

c_e_gen_limit(15)_:
+1 bus_gen_ss(9)
= 0

c_e_gen_limit(16)_:
+1 bus_gen_ss(10)
= 0

c_e_gen_limit(17)_:
+1 bus_gen_ss(11)
= 0

c_e_gen_limit(18)_:
+1 bus_gen_ss(12)
= 0

c_e_gen_limit(19)_:
+1 bus_gen_ss(13)
= 0

c_e_power_flow(1)_:
+1 Pij_ss(0)
-16.900456312320433 theta_ss(0)
+16.900456312320433 theta_ss(1)
= 0.0

c_e_power_flow(2)_:
+1 Pij_ss(1)
-4.483500717360115 theta_ss(0)
+4.483500717360115 theta_ss(4)
= 0.0

c_e_power_flow(3)_:
+1 Pij_ss(2)
-5.051270394504217 theta_ss(1)
+5.051270394504217 theta_ss(2)
= 0.0

c_e_power_flow(4)_:
+1 Pij_ss(3)
-5.671506352087114 theta_ss(1)
+5.671506352087114 theta_ss(3)
= 0.0

c_e_power_flow(5)_:
+1 Pij_ss(4)
-5.751092707614447 theta_ss(1)
+5.751092707614447 theta_ss(4)
= 0.0

c_e_power_flow(6)_:
+1 Pij_ss(5)
-5.846927439630474 theta_ss(2)
+5.846927439630474 theta_ss(3)
= 0.0

c_e_power_flow(7)_:
+1 Pij_ss(6)
+23.747328425552123 theta_ss(4)
-23.747328425552123 theta_ss(3)
= 0.0

c_e_power_flow(8)_:
+1 Pij_ss(7)
-4.889512660317341 theta_ss(3)
+4.889512660317341 theta_ss(6)
= 0.0

c_e_power_flow(9)_:
+1 Pij_ss(8)
-1.8554995578159004 theta_ss(3)
+1.8554995578159004 theta_ss(8)
= 0.0

c_e_power_flow(10)_:
+1 Pij_ss(9)
-4.257445335253384 theta_ss(4)
+4.257445335253384 theta_ss(5)
= 0.0

c_e_power_flow(11)_:
+1 Pij_ss(10)
-5.027652086475616 theta_ss(5)
+5.027652086475616 theta_ss(10)
= 0.0

c_e_power_flow(12)_:
+1 Pij_ss(11)
-3.9091513232477233 theta_ss(5)
+3.9091513232477233 theta_ss(11)
= 0.0

c_e_power_flow(13)_:
+1 Pij_ss(12)
-7.676364473785216 theta_ss(5)
+7.676364473785216 theta_ss(12)
= 0.0

c_e_power_flow(14)_:
+1 Pij_ss(13)
-5.676979846721544 theta_ss(6)
+5.676979846721544 theta_ss(7)
= 0.0

c_e_power_flow(15)_:
+1 Pij_ss(14)
-9.09008271975275 theta_ss(6)
+9.09008271975275 theta_ss(8)
= 0.0

c_e_power_flow(16)_:
+1 Pij_ss(15)
-11.834319526627219 theta_ss(8)
+11.834319526627219 theta_ss(9)
= 0.0

c_e_power_flow(17)_:
+1 Pij_ss(16)
-3.698498409645684 theta_ss(8)
+3.698498409645684 theta_ss(13)
= 0.0

c_e_power_flow(18)_:
+1 Pij_ss(17)
+5.206435153850159 theta_ss(10)
-5.206435153850159 theta_ss(9)
= 0.0

c_e_power_flow(19)_:
+1 Pij_ss(18)
-5.003001801080648 theta_ss(11)
+5.003001801080648 theta_ss(12)
= 0.0

c_e_power_flow(20)_:
+1 Pij_ss(19)
-2.873398080570082 theta_ss(12)
+2.873398080570082 theta_ss(13)
= 0.0

c_u_power_flow(21)_:
+1 Pij_ss(0)
<= 1000.0

c_l_power_flow(22)_:
+1 Pij_ss(0)
>= -1000.0

c_u_power_flow(23)_:
+1 Pij_ss(1)
<= 1000.0

c_l_power_flow(24)_:
+1 Pij_ss(1)
>= -1000.0

c_u_power_flow(25)_:
+1 Pij_ss(2)
<= 1000.0

c_l_power_flow(26)_:
+1 Pij_ss(2)
>= -1000.0

c_u_power_flow(27)_:
+1 Pij_ss(3)
<= 1000.0

c_l_power_flow(28)_:
+1 Pij_ss(3)
>= -1000.0

c_u_power_flow(29)_:
+1 Pij_ss(4)
<= 1000.0

c_l_power_flow(30)_:
+1 Pij_ss(4)
>= -1000.0

c_u_power_flow(31)_:
+1 Pij_ss(5)
<= 1000.0

c_l_power_flow(32)_:
+1 Pij_ss(5)
>= -1000.0

c_u_power_flow(33)_:
+1 Pij_ss(6)
<= 1000.0

c_l_power_flow(34)_:
+1 Pij_ss(6)
>= -1000.0

c_u_power_flow(35)_:
+1 Pij_ss(7)
<= 1000.0

c_l_power_flow(36)_:
+1 Pij_ss(7)
>= -1000.0

c_u_power_flow(37)_:
+1 Pij_ss(8)
<= 1000.0

c_l_power_flow(38)_:
+1 Pij_ss(8)
>= -1000.0

c_u_power_flow(39)_:
+1 Pij_ss(9)
<= 1000.0

c_l_power_flow(40)_:
+1 Pij_ss(9)
>= -1000.0

c_u_power_flow(41)_:
+1 Pij_ss(10)
<= 1000.0

c_l_power_flow(42)_:
+1 Pij_ss(10)
>= -1000.0

c_u_power_flow(43)_:
+1 Pij_ss(11)
<= 1000.0

c_l_power_flow(44)_:
+1 Pij_ss(11)
>= -1000.0

c_u_power_flow(45)_:
+1 Pij_ss(12)
<= 1000.0

c_l_power_flow(46)_:
+1 Pij_ss(12)
>= -1000.0

c_u_power_flow(47)_:
+1 Pij_ss(13)
<= 1000.0

c_l_power_flow(48)_:
+1 Pij_ss(13)
>= -1000.0

c_u_power_flow(49)_:
+1 Pij_ss(14)
<= 1000.0

c_l_power_flow(50)_:
+1 Pij_ss(14)
>= -1000.0

c_u_power_flow(51)_:
+1 Pij_ss(15)
<= 1000.0

c_l_power_flow(52)_:
+1 Pij_ss(15)
>= -1000.0

c_u_power_flow(53)_:
+1 Pij_ss(16)
<= 1000.0

c_l_power_flow(54)_:
+1 Pij_ss(16)
>= -1000.0

c_u_power_flow(55)_:
+1 Pij_ss(17)
<= 1000.0

c_l_power_flow(56)_:
+1 Pij_ss(17)
>= -1000.0

c_u_power_flow(57)_:
+1 Pij_ss(18)
<= 1000.0

c_l_power_flow(58)_:
+1 Pij_ss(18)
>= -1000.0

c_u_power_flow(59)_:
+1 Pij_ss(19)
<= 1000.0

c_l_power_flow(60)_:
+1 Pij_ss(19)
>= -1000.0

c_u_angle_limit(1)_:
+1 theta_ss(0)
-1 theta_ss(1)
<= 6.283185307179586

c_l_angle_limit(2)_:
+1 theta_ss(0)
-1 theta_ss(1)
>= -6.283185307179586

c_u_angle_limit(3)_:
+1 theta_ss(0)
-1 theta_ss(4)
<= 6.283185307179586

c_l_angle_limit(4)_:
+1 theta_ss(0)
-1 theta_ss(4)
>= -6.283185307179586

c_u_angle_limit(5)_:
+1 theta_ss(1)
-1 theta_ss(2)
<= 6.283185307179586

c_l_angle_limit(6)_:
+1 theta_ss(1)
-1 theta_ss(2)
>= -6.283185307179586

c_u_angle_limit(7)_:
+1 theta_ss(1)
-1 theta_ss(3)
<= 6.283185307179586

c_l_angle_limit(8)_:
+1 theta_ss(1)
-1 theta_ss(3)
>= -6.283185307179586

c_u_angle_limit(9)_:
+1 theta_ss(1)
-1 theta_ss(4)
<= 6.283185307179586

c_l_angle_limit(10)_:
+1 theta_ss(1)
-1 theta_ss(4)
>= -6.283185307179586

c_u_angle_limit(11)_:
+1 theta_ss(2)
-1 theta_ss(3)
<= 6.283185307179586

c_l_angle_limit(12)_:
+1 theta_ss(2)
-1 theta_ss(3)
>= -6.283185307179586

c_u_angle_limit(13)_:
-1 theta_ss(4)
+1 theta_ss(3)
<= 6.283185307179586

c_l_angle_limit(14)_:
-1 theta_ss(4)
+1 theta_ss(3)
>= -6.283185307179586

c_u_angle_limit(15)_:
+1 theta_ss(3)
-1 theta_ss(6)
<= 6.283185307179586

c_l_angle_limit(16)_:
+1 theta_ss(3)
-1 theta_ss(6)
>= -6.283185307179586

c_u_angle_limit(17)_:
+1 theta_ss(3)
-1 theta_ss(8)
<= 6.283185307179586

c_l_angle_limit(18)_:
+1 theta_ss(3)
-1 theta_ss(8)
>= -6.283185307179586

c_u_angle_limit(19)_:
+1 theta_ss(4)
-1 theta_ss(5)
<= 6.283185307179586

c_l_angle_limit(20)_:
+1 theta_ss(4)
-1 theta_ss(5)
>= -6.283185307179586

c_u_angle_limit(21)_:
+1 theta_ss(5)
-1 theta_ss(10)
<= 6.283185307179586

c_l_angle_limit(22)_:
+1 theta_ss(5)
-1 theta_ss(10)
>= -6.283185307179586

c_u_angle_limit(23)_:
+1 theta_ss(5)
-1 theta_ss(11)
<= 6.283185307179586

c_l_angle_limit(24)_:
+1 theta_ss(5)
-1 theta_ss(11)
>= -6.283185307179586

c_u_angle_limit(25)_:
+1 theta_ss(5)
-1 theta_ss(12)
<= 6.283185307179586

c_l_angle_limit(26)_:
+1 theta_ss(5)
-1 theta_ss(12)
>= -6.283185307179586

c_u_angle_limit(27)_:
+1 theta_ss(6)
-1 theta_ss(7)
<= 6.283185307179586

c_l_angle_limit(28)_:
+1 theta_ss(6)
-1 theta_ss(7)
>= -6.283185307179586

c_u_angle_limit(29)_:
+1 theta_ss(6)
-1 theta_ss(8)
<= 6.283185307179586

c_l_angle_limit(30)_:
+1 theta_ss(6)
-1 theta_ss(8)
>= -6.283185307179586

c_u_angle_limit(31)_:
+1 theta_ss(8)
-1 theta_ss(9)
<= 6.283185307179586

c_l_angle_limit(32)_:
+1 theta_ss(8)
-1 theta_ss(9)
>= -6.283185307179586

c_u_angle_limit(33)_:
+1 theta_ss(8)
-1 theta_ss(13)
<= 6.283185307179586

c_l_angle_limit(34)_:
+1 theta_ss(8)
-1 theta_ss(13)
>= -6.283185307179586

c_u_angle_limit(35)_:
-1 theta_ss(10)
+1 theta_ss(9)
<= 6.283185307179586

c_l_angle_limit(36)_:
-1 theta_ss(10)
+1 theta_ss(9)
>= -6.283185307179586

c_u_angle_limit(37)_:
+1 theta_ss(11)
-1 theta_ss(12)
<= 6.283185307179586

c_l_angle_limit(38)_:
+1 theta_ss(11)
-1 theta_ss(12)
>= -6.283185307179586

c_u_angle_limit(39)_:
+1 theta_ss(12)
-1 theta_ss(13)
<= 6.283185307179586

c_l_angle_limit(40)_:
+1 theta_ss(12)
-1 theta_ss(13)
>= -6.283185307179586

c_e_angle_limit(41)_:
+1 theta_ss(0)
= 0

bounds
   0 <= bus_gen_ss(0) <= 3.324
   0 <= bus_gen_ss(1) <= 3.324
   0 <= bus_gen_ss(2) <= 3.324
   0 <= bus_gen_ss(5) <= 3.324
   0 <= bus_gen_ss(7) <= 3.324
   -100000.0 <= Pij_ss(0) <= 100000.0
   -100000.0 <= Pij_ss(1) <= 100000.0
   -100000.0 <= Pij_ss(2) <= 100000.0
   -100000.0 <= Pij_ss(3) <= 100000.0
   -100000.0 <= Pij_ss(4) <= 100000.0
   -100000.0 <= Pij_ss(5) <= 100000.0
   -100000.0 <= Pij_ss(6) <= 100000.0
   -100000.0 <= Pij_ss(7) <= 100000.0
   -100000.0 <= Pij_ss(8) <= 100000.0
   -100000.0 <= Pij_ss(9) <= 100000.0
   -100000.0 <= Pij_ss(10) <= 100000.0
   -100000.0 <= Pij_ss(11) <= 100000.0
   -100000.0 <= Pij_ss(12) <= 100000.0
   -100000.0 <= Pij_ss(13) <= 100000.0
   -100000.0 <= Pij_ss(14) <= 100000.0
   -100000.0 <= Pij_ss(15) <= 100000.0
   -100000.0 <= Pij_ss(16) <= 100000.0
   -100000.0 <= Pij_ss(17) <= 100000.0
   -100000.0 <= Pij_ss(18) <= 100000.0
   -100000.0 <= Pij_ss(19) <= 100000.0
   0 <= bus_gen_ss(3) <= 3.324
   0 <= bus_gen_ss(4) <= 3.324
   0 <= bus_gen_ss(6) <= 3.324
   0 <= bus_gen_ss(8) <= 3.324
   0 <= bus_gen_ss(9) <= 3.324
   0 <= bus_gen_ss(10) <= 3.324
   0 <= bus_gen_ss(11) <= 3.324
   0 <= bus_gen_ss(12) <= 3.324
   0 <= bus_gen_ss(13) <= 3.324
   -6.283185307179586 <= theta_ss(0) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(1) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(4) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(2) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(3) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(6) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(8) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(5) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(10) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(11) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(12) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(7) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(9) <= 6.283185307179586
   -6.283185307179586 <= theta_ss(13) <= 6.283185307179586
end
