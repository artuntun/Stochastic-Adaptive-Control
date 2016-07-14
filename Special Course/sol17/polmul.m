function c=polmul(a,b)
%usage: c=polmul(a,b)
%
% c=a*b
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
%
 
c=conv(a,b);
c=c(:)';
