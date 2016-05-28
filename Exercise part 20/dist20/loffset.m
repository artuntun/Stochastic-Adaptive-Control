function [X0,u0]=loffset(A,B,C,w)
% [X0,u0]=loffset(A,B,C,w)

if nargin==3,
 w=1;
end

ns=length(A);
F=[A-eye(ns) B;C 0];
X=inv(F)*[zeros(ns,1); w];
u0=X(end);
X0=X(1:end-1);


