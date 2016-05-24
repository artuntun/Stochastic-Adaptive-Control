function H=polhank(a,n)

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

a=a(:)'; na=length(a)-1;
H=hankel(a); H=H(1:end-1,2:end);

if nargin > 1,
 H=[H; zeros(n-na,na)];
 end
