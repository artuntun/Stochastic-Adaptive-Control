function x=nl2tank(x,u)
% Determine Next value of state vector for a
% Discrite time linear model

global As Bs ds

x=As*x+Bs*u+ds;
