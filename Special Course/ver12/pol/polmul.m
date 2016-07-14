function c=polmul(a,b)
%usage: c=polmul(a,b)
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised 1998

a=a(:)'; b=b(:)'; 
c=conv(a,b);
