function [r,s,g] = dsnmv(a,b,k,c);
%design of a minimal variance controller
%
%Usage:  [r,s,g]=dsnmv(a,b,k,c)
%          [r,s]=dsnmv(a,b,k,c)
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

[g,s]=truncimp(a,k,c);
r=polmul(b,g);

%r0=r(1);
%r=r/r0; q=q/r0; s=s/r0;
