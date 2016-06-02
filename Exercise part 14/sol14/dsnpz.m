function [q,r,s,g] = dsnpz(a,b,k,c,am,bm);
%function [q,r,s,g] = dsnpz(a,b,k,c,am,bm);
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
 
na=length(a)-1;
amc=conv(am,c);
namc=length(amc)-1;
ns=max(na-1,namc-k);
bb=poldel(1,k);
[g,s]=dioph(a,bb,amc,k-1,ns);
q=conv(c,bm);
r=conv(b,g);

r0=r(1); r=r/r0; s=s/r0; q=q/r0;
