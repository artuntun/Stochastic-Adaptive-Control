function act2(u)
% Actuator - Implement control action

global Stsys Snsys
global time Ts


Stsys.sim.X = Stsys.A*Stsys.sim.X+Stsys.B*u+Stsys.B*Stsys.sim.S1*randn(Stsys.sim.nv,1);

time=time+Ts;
