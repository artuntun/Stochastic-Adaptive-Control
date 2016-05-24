function [q,r,s,g] = dsnpz(a,b,k,c,am,bm);
%function [q,r,s,g] = dsnpz(a,b,k,c,am,bm);
%
% Design of a PZ controller
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

amc=polmul(am,c);
[g,s]=truncimp(a,k,amc);
q=polmul(c,bm);
r=polmul(b,g);

%r0=r(1); r=r/r0; s=s/r0; q=q/r0;
