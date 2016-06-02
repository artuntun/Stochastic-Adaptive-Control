function act(u)
% Actuator - Implement control action
% System with non-white noise process

global Stsys Snsys
global time Ts

% tank system update
Stsys.sim.X = Stsys.A*Stsys.sim.X+Stsys.B*u+Stsys.B*Snsys.C*Snsys.sim.X;

% noise sequence update
Snsys.sim.X = Snsys.A*Snsys.sim.X+Snsys.B*Snsys.sim.S1*randn(Snsys.sim.nv,1);

time=time+Ts;
