function u=sqwave(n,per)
% Usage:  u=sqwave(n,per)
%
% Create a square wave with length n and
% a period eqaul per.

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

m=ceil(n/per);
u=osc(m);
u=kron(u,ones(per,1));
u=u(1:n);
