function bb=poldel(b,k);
% Determine q^{-k}B(q^{-1})
%
% Usage bk=poldel(b,k)
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised in Oxford
 
b=b(:)'; bb=[zeros(1,max(k,0)) b];
