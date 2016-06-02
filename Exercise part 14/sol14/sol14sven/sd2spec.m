function [a,b]=sd2spec(ac,bc)
%Usage: a=sd2spec(ac)
%       [a,b]=sd2spec(ac,bc)
%
%Returns the spektrum from the spectal density,
%ie. from ac (and bc) where:
%
% ac= a0+a1*cos(wT)+a2*cos(2wT)+...
%
%Here:
%
% a=an*z^n+ ... + a0 + ... + anz^{-n}
%

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% Test file: t43.m

a=[0.5*fliplr(ac(2:end)) ac(1) ac(2:end)*0.5];
if nargin>1,
 b=[0.5*fliplr(bc(2:end)) bc(1) bc(2:end)*0.5];
end
