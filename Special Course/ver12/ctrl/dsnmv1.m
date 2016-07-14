function [q,r,s,g] = dsnmv1(a,b,k,c,rho);
%function [q,r,s,g] = dsnmv1(a,b,k,c,rho);
%
% Design of a MV1 (rho*((1-q^{-1})u_t)^2 in cost)
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

[g,s]=truncimp(a,k,c);
alf=rho/b(1);
r=polsum(polmul(b,g),alf*polmul(c,[1 -1]));
q=c;

%r0=r(1); r=r/r0; s=s/r0; q=q/r0;
