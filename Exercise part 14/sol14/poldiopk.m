function [g,s]=poldiopk(a,k,c);
% Usage: [g,s]=poldiopk(a,k,c);
%
% Solve the simple diophantine equation
%
% C=AG+q^{-k}S
%
% with respect to G and S

a=a(:)'; c=c(:)';
na=length(a);
nc=length(c);
n=max(na,nc);
a=[a zeros(1,n-na)];
c=[c zeros(1,n-nc)];

g=dimpulse(c,a,k)';
s=polsum(c,-polmul(a,g));
s=s(k+1:end);

