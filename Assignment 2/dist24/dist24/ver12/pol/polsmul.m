function [c,p,h,ta]=polsmul(ai,bi,typ,ts)
% Usage [c,p,h,ta]=polsmul(a,b,type,ts)
%
% Spectral multiplication between a and b.
%
% c = a\tilde(b) = T(A)*H*B
%
% \tilde(s) = -s, s^{-1} eller -\frac{s}{1+sh}
%
% type: 's', 'd' or 'z' domain
% ts:   sampling period (needed for delta (d) domain)

% test file: t50.m

% Programmed 1996 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark
% Revised 2002

mon=0; % monitor (1)

if nargin<3, % default domain is z.
 typ='z';
 end

a=ai(:); b=bi(:);
in=max(size(a)); n=in-1; 
im=max(size(b)); m=im-1;
l=n+m+1;
h=zeros(im,im); % Reflection matrix
ta=zeros(l,im); % Toeplitz matrix for a
%----------------------------------------------------------------------
% S - domain 
%----------------------------------------------------------------------
if typ=='s',
 if mon==1, disp('S-domain'); end;
 p=n+m:-1:0;
 h=eye(im);
 for i=m:-2:1, h(i,i)=-1; end
%----------------------------------------------------------------------
% Z - domain 
%----------------------------------------------------------------------
elseif typ=='z',
 if mon==1, disp('Z-domain'); end;
 %c=conv(a,fliplr(a));
 p=n:-1:-m;
 for i=1:im,
  h(i,m+2-i)=1;
 end
%----------------------------------------------------------------------
% Delta - domain 
%----------------------------------------------------------------------
elseif typ=='d',
 if mon==1, disp('delta- domain'); end;
 p=n+m:-1:0;
 for i=0:m,
  for k=i:m,
   h(i+1,k+1)=(-1)^(m-k)*comp(k,i)*ts^(k-i);
   end
 end
end
%----------------------------------------------------------------------
% Post Processing
%----------------------------------------------------------------------
for i=1:im,
 ta(i:n+i,i)=a; 
 end
c=ta*h*b; c=c(:)';
if mon==1,
 disp(ta)
 disp(h)
 end




