function [a1,b1,c1,d1]=trf2ss(a,b,k);
%Return a state space description (type=2) of a transfer function
%
% Usage: [a,b,c,d]=trf2ss(a,b);
%        [a,b,c,d]=trf2ss(a,b,k);
%
%See syscan for a canonical form
%See sysdr for a direct realization
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

if nargin>2,
 b=poldel(b,k);
end;
 
a=a(:)'; b=b(:)';
a0=a(1); a=a/a0; b=b/a0;
n=max([size(a) size(b)])-1;
an=zeros(n+1,1); m=max(size(a)); an(1:m)=a;
bn=zeros(n+1,1); m=max(size(b)); bn(1:m)=b;

if n==0,
 %a1=[]; b1=[]; c1=[]; d1=bn(1);
 a1=0; b1=0; c1=0; d1=bn(1);
elseif n==1,
 a1=-an(2); b1=bn(2)-bn(1)*an(2); c1=1; d1=bn(1);
 else
  a1=zeros(n,n); b1=zeros(n,1); c1=zeros(1,n); d=0;
  a1(1:n-1,2:n)=eye(n-1); a1(:,1)=-an(2:n+1);
  b1=bn(2:n+1)-an(2:n+1)*bn(1); c1(1)=1; d1=bn(1);
 end

if nargout==1,
 a1=ss(a1,b1,c1,d1);
end
