function [u,du]=prbs(n,p)
%function [u,du]=prbs(n,p)
%
%Generates a randomly changing
%binary sequence
% 
% n: no of samples
% p: change density.
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

e=rand(n,1);
du=sign(e-p);
u=zeros(n,1);
u(1)=1;
for i=2:n,
 u(i)=u(i-1)*du(i);
 end
end
