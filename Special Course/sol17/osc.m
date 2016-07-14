function u=osc(n)
%Usage: u=osc(n)
%
%Generates a sequence (length n) of ones with 
%changing sign.

% Programmed by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark
%

if nargin<1,
 n=100;
end

u=kron(ones(ceil(n/2),1),[1 -1]');
u=u(1:n);
