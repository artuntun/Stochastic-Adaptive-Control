function [a,fac]=polmon(b);
%Usage: [a,fac]=polmon(b);
%
%Transform the polynomium b into a monic polynomium
%and is factor b(1)
%
% b = b0 + b1*q^{-1} + ..
%
%   = fac*(1 + a1*q^{-1} + ... )
%
%   = fac*a
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

fac=b(1); 
a=b/fac;

