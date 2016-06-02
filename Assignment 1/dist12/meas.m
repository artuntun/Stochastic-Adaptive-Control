function [y,t]=meas

global Stsys
global time

y=Stsys.C*Stsys.sim.X+Stsys.sim.S2*randn(Stsys.sim.ne,1);
t=time;

