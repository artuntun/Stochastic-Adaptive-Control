function [ap,bp,g] = dsnprd(a,c,k);
%function [ap,bp,g] = dsnprd(a,c,k);
%
% Find the predictor yh=bp/ap*y (i.e. bp and ap).
% The prediction error is ye=g*e
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Last revised 2005
 
na=max(size(a))-1;
nc=max(size(c))-1;
ns=max(na-1,nc-k);
bb=poldel(1,k);
[g,s]=dioph(a,bb,c,k-1,ns);
ap=c;
bp=s;
end
