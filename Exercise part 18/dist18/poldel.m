function bb=poldel(b,k);
%usage bk=poldel(b,k)
%
% Determine q^{-k}B(q^{-1})
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
 
b=b(:)'; bb=[zeros(1,max(k,0)) b];
