function v=vecshd(v,u);
%usage: vec=vecshd(v,u)
%
%shift down a vector v, pad with u or zero.
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 

n=max(size(v));
v(2:n)=v(1:n-1);
if nargin==1,
 v(1)=0;
else
 v(1)=u;
end
