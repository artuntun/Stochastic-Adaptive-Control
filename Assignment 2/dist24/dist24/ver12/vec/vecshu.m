function v=vecshu(v);
%usage: vec=vecshu(v)
%
%shift up a vector, pad with zero
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 
 
n=max(size(v));
v(1:n-1)=v(2:n);
v(n)=0;
end
