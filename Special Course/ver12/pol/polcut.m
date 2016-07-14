function b=polcut(bb,k)
% usage: function b=polcut(b,k)
%
% Cuts the last part (from order k) of the polynomium b, ie
% performs the operation:
%
% b <- [ q^{k}*b ]
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
 
b=bb(k+1:end);


