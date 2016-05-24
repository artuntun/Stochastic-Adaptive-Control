function [ry,rye,t,vary]=acf(a,c,v,m);

%Usage: [ry,rye,t,vary]=acf(a,c,v,m)
%
% a:  	Denuminator polynomium
% c:    Numinator polynomium
% v:    Innovation variance.
% m:	max number of lags
%
% ry:	covariance function
% rye:  cross covariance function
% t:	time index

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% Testfil: t23.m

mode=0; % negative lags (1) or only non negative lags (0)

a=a(:)'; c=c(:)';
%----------------------------------------------------------------------
na=length(a); nc=length(c);
if na>nc,
 c=[c zeros(1,na-nc)];
else
 a=[a zeros(1,nc-na)];
end
n=max(na,nc); 
%----------------------------------------------------------------------
% -> ccf <-
u=zeros(max(n+1,m+1),1);
u(1)=1;
h=filter(c,a,u); h=h(:);
rye=h(1:m+1)*v;
%----------------------------------------------------------------------
% -> acf <-
ad=a';
au=a';
Md=ad;
Mu=zeros(n,1);
cl=c;
Mc=cl;
for i=2:n
 ad=[0; ad(1:end-1)];
 Md=[Md ad];
 au=[au(2:end);0];
 Mu=[Mu au];
 cl=[cl(2:end) 0];
 Mc=[Mc;cl];
end;
h=h(1:n);
b=Mc*h*v;
ry=(Mu+Md)\b;
% ry contains r(0), ..., r(n)
vary=ry(1);

if m+1>n
 av=-a(2:end);
 x=flipud(ry(2:end));
 for i=1:m+1-n,
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
