function [ca,cb]=cosspa(aspec,bspec);
% Usage acos=cospa(aspec)
%       [acos,bcos]=cospa(aspec,bspec)
%
% Given the spectrum (aspec, bspec) this procedure
% returns the spectral density in terms of cos(wh).
% ie.
% acos= a0 + a1 cos(wT) + a2 cos(2wT) + ...
%
% Notice:
% aspec = m_1z^{-1} + m_0 + m_1 z
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% test file: t43.m

n=length(aspec); n=(n+1)/2;
aspec=aspec(n:end);
ca=[ aspec(1) 2*aspec(2:end)]; 

if nargin==2, 
 n=length(bspec); n=(n+1)/2;
 bspec=bspec(n:end);
 cb=[ bspec(1) 2*bspec(2:end)]; 
end
