function [Y,X0]=sfilt(A,B,C,D,U)
%
% Filter u trough a filter. The initial state is determined
% such that ||Y-U|| is minimized.
%
% Usage: [y,x0]=sfilt(a,b,c,d,u);
% or     [y,x0]=sfilt(a,b,u);

%
if nargin==3,
 [A,B,C,D]=trf2ss(A,B);
 end

x=ltitr(A,B,U);
Yf=x*C+D*U;
n=max(size(A));
O=[]; B0=zeros(n,1);
for i=1:n,
 X0=zeros(n,1); X0(i)=1;
 O=[O ltitr(A,B0,U,X0)*C];
 end
X0=-inv(O'*O)*O'*(Yf-U);
Y=O*X0+Yf;
