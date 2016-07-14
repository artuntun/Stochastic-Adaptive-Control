function [ry,rye,t,vary]=acfar(a,v,m);
 
%Usage: [ry,rye,t]=acfar(a,v,m)
% m:	max number of lags
% a:  	denuminator polynomium
%
% ry:	covariance function
% rye:  cross covariance function
% t:	time index

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 

% Testfil: t22.m
% home: sys

mode=0; % negative lags (1), nonnegative lags (0)

a=a(:)'; in=length(a); n=in-1;
% -------- ccf ------------
u=zeros(m+1,1);
u(1)=1;
h=filter(1,a,u);
rye=h*v;
% -------- acf ------------
ad=a';
au=a';
Md=ad;
Mu=zeros(in,1);
for i=2:in
 ad=[0; ad(1:end-1)];
 Md=[Md ad];
 au=[au(2:end);0];
 Mu=[Mu au];
end;
b=[v;zeros(n,1)];
ry=(Mu+Md)\b; 
% -------------------------
% ry contains r0, r1, ... rn
vary=ry(1);

if m>n 
 av=-a(2:end);
 x=flipud(ry(2:end));
 for i=1:m-n,
  rn=av*x;
  x=[rn;x(1:end-1)];
  ry=[ry;rn];
 end
elseif m<n,
 ry=ry(1:m+1);
end

ry=ry(:)'; rye=rye(:)';
if mode==1,
 t=-m:m; 
 ry=[fliplr(ry(2:end)) ry];
 rye=[zeros(1,m) rye];
else
 t=0:m; 
end
