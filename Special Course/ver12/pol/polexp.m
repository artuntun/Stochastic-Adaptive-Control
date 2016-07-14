function h=polexp(a,b,nsp)
% Expansion of polynomial fraction.
% Usage: h=polexp(a,b,n)
%
% Determine \frac{b}{a}= [h]_{n}
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 

% Ref.: Kucera p. 149 
% Test: t32.m

m=max(size(a))-1;
n=max(size(b))-1;
h=zeros(nsp+1,1);

if n>=0,
 h(1)=b(1)/a(1);
else
 h(1)=0;
end

for k=1:nsp,
 s=0;
 for j=0:min(m,k),
  s=s+a(j+1)*h(k-j+1);
 end
 if k<=n,
  h(k+1)=(b(k+1)-s)/a(1);
 else
  h(k+1)=-s/a(1);
 end
end

