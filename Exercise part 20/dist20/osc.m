function u=osc(n)
%Usage: u=osc(n)
%
%Generates a sequence (length n) of ones with 
%changing sign.

% Programmed by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

u=ones(n,1);
i=2:2:n;
u(i)=-1;

