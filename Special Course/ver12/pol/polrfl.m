function [c,h]=polrfl(ai,dom,hs)
% Spectral Reflection of a Polynomial
%
% Usage: [c,h]=polrfl(ai,dom,hs)
%

% Testfile: t54.m

if nargin<2,
 dom='z';
end
a=ai(:)';
n=max(size(a))-1;
if dom=='z',
 disp('Z-domain')
 c=fliplr(a);
 h=zeros(n+1,n+1);
 for i=1:n+1,
  h(i,n+2-i)=1;
 end
elseif dom=='s',
 disp('S-domain')
 c=a; h=eye(n+1);
 for i=n:-2:1, c(i)=-a(i); h(i,i)=-1; end
elseif dom=='d',
 if nargin<3,
  hs=0;
  disp('h is needed in the Delta domain')
 end
 disp('Delta-domain')
 c=zeros(1,n+1); h=zeros(n+1,n+1);
 for i=0:n,
  for k=i:n,
   c(i+1)=c(i+1)+a(k+1)*(-1)^(n-k)*comp(k,i)*hs^(k-i);
   h(i+1,k+1)=(-1)^(n-k)*comp(k,i)*hs^(k-i);
   end
 end
elseif dom=='g',
 disp('Gamma-domain')
 c=a; h=eye(n+1);
 for i=n:-2:1, c(i)=-a(i); h(i,i)=-1; end
else
 disp('Unknown domain')
end
end
