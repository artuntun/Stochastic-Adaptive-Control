function bb=poldel(b,k);
%usage a=poldel(b,k)
%
% Determine q^{-k}B(q^{-1})
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
 
b=b(:)'; bb=[zeros(1,max(k,0)) b];
