function u=sinwave(n,per)
% Usage:  u=sinwave(n,per)
%
% Create a sinus wave with length n and
% a period eaul per.

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

t=0:n-1; t=2*pi*t(:)/per;
u=sin(t);
