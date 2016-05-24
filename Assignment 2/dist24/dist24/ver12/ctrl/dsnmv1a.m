function [q,r,s,g] = dsnmv1a(a,b,k,c,rho);
%function [q,r,s,g] = dsnmv1a(a,b,k,c,rho);
%
% Design of a MV1a controller (MV1 with u^2)
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised 2002.

[g,s]=truncimp(a,k,c);
alf=rho/b(1);
r=polsum(polmul(b,g),alf*c);
q=c;

%r0=r(1); r=r/r0; s=s/r0; q=q/r0;
