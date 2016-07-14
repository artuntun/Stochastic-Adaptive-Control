function [ry,t]=acfss(a,r1,c,r2,r12,m);
 
%usage: [ry,t]=acf(a,r1,c,r2,r12,m)
% m:	max number of lags
% a:  	System matrix
% r1:   variance of processnoise
% c:    Observation matrix (row)
% r2:   Variance of Measurement noise
% r12:  Crosscovariance of Process- and Measurement noise
% ry:	covariance function
% t:	time index

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 

% Testfil: t24.m

mode=0;

%----------------------------------------------------------------------
p=syslyap(a,r1);
%----------------------------------------------------------------------
n=length(a);
ry=c*p*c'+r2;
f=eye(n);
for i=1:m,
 ry=[ry c*f*(a*p*c'+r12)];
 f=a*f;
end
t=0:m;
