function [r,s,g] = dsnmv(a,b,k,c);
%design of a minimal variance controller
%
%Usage:  [r,s,g]=dsnmv(a,b,k,c)
%          [r,s]=dsnmv(a,b,k,c)
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised 2012

[g,s]=truncimp(a,k,c);
r=polmul(b,g);

%r0=r(1);
%r=r/r0; q=q/r0; s=s/r0;
