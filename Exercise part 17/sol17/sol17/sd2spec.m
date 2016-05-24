function [a,b]=sd2spec(ac,bc)
% Usage: b=sd2spec(bc)
%       [a,b]=sd2spec(ac,bc)
%
% Returns the spektrum Bs/As from the spectal density Bsd/Asd,
% where
%
% Asd = a0+a1*cos(wT)+a2*cos(2wT)+...
% Bsd = b0+b1*cos(wT)+b2*cos(2wT)+...
%
% and where:
%
% As=asn*z^n+ ... + as0 + ... + asn*z^{-n}
% Bs=bsn*z^n+ ... + bs0 + ... + bsn*z^{-n}
%
% The input arguments are:
%
% ac=[ a0 a1 a2 ...]
% bc=[ b0 b1 b2 ...]
% 
% and the outputs are:
%
% a=[asn ... as0 ... asn]
% b=[bsn ... bs0 ... bsn]


% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% Test file: t43.m
% home: sys

a=[0.5*fliplr(ac(2:end)) ac(1) ac(2:end)*0.5];
if nargin>1,
 b=[0.5*fliplr(bc(2:end)) bc(1) bc(2:end)*0.5];
end
