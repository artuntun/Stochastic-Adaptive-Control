function dx=dl2tank(t,x,flag,u)
% Determine derivative of linear continous time model
% ie.
%
% dx=A*x+B*u

global Ac Bc dc

dx=Ac*x+Bc*u+dc;
