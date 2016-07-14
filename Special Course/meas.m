function [y,t]=meas  

global As Bs Cs Ds Xs en
global t Ts 

en=randn;
y=Cs*Xs+Ds(:,2)*en;

t=t+Ts;
