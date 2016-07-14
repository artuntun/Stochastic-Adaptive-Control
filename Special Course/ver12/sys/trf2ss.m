function [a1,b1,c1,d1]=trf2ss(a,b,k);
%Return a state space description (type=2) of a transfer function
%
% Usage: [a,b,c,d]=trf2ss(...);
%        sssys=trf2ss(...)
%
%        ...=trf2ss(a,b);
%        ...=trf2ss(a,b,k);
%        ...=trf2ss(trfsys);
%
%See syscan for a canonical form
%See sysdr for a direct realization

% Testfile: t1.m
% home: sys
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

if nargin>2,
 b=poldel(b,k);
elseif nargin==1,
 b=a.num{1};
 a=a.den{1};
end;
 
a=a(:)'; b=b(:)';
a0=a(1); a=a/a0; b=b/a0;
ma=length(a); mb=length(b);
m=max(ma,mb);
if ma>mb,
 b=[b zeros(1,m-mb)];
elseif mb>ma,
 a=[a zeros(1,m-ma)];
end
n=m-1;

if n==0,
 a1=[]; b1=[]; c1=[]; d1=b(1);
elseif n==1,
 a1=-a(2); b1=b(2)-b(1)*a(2); c1=1; d1=b(1);
 else
  a1=zeros(n,n); b1=zeros(n,1); c1=zeros(1,n); d=0;
  a1(1:n-1,2:n)=eye(n-1); a1(:,1)=-a(2:n+1)';
  b1=b(2:n+1)'-a(2:n+1)'*b(1); c1(1)=1; d1=b(1);
 end

if nargout==1,
 sys=ss(a1,b1,c1,d1,1);
 a1=sys;
end
