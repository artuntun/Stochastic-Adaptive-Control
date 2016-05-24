function [ry,rye,t,vary]=acfma(c,v,m);
 
%usage: [ry,rye,t]=acfma(c,v,n)
% c:    numinator polynomium
% v:	variance of innovation
% m:	max number of lags
%
% ry:	covariance function
% rye:  cross covariance function
% t:	time index

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% Testfil: t21.m

% ry:    -n 1-n ...  -1  0   1  ... n-1 n
% i:      1  2  ...   n n+1 n+2 ...  2n 2n+1 

mode=0; % only nonnegative time lags (0) or negative lags (1)

c=c(:)';
n=length(c);
im=m+1;

ry=conv(c,fliplr(c))*v;
ry=ry(n:end);
rye=c*v;

if m>=n,
 ry=[ry zeros(1,im-n)];
 rye=[rye zeros(1,im-n)];
else
 ry=ry(1:im);
 rye=rye(1:im);
end;

if mode==1,
 ry=[fliplr(ry(2:end)) ry];
 rye=[zeros(1,m) rye];
 t=-m:m;
else
 t=0:m;
end
