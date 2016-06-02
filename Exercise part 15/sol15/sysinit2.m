function [A,B,k,C,vare]=sysinit(dets)
% Initialise system, ie. determine models and constants.
% 
% Usage: [A,B,k,C]=sysinit(dets)
%
% dets: Deterministic (1) eller stochastic (0) simulation

global t t0 Tnext Ts	% Time administration
global As Bs Cs Ds Xs 	% D-time Linear model

Ts=0.1;

%--------------------------------------------------------------------------
ac=conv([1 0],[1 1]);
bc=100;
sysc=tf(bc,ac);
sysd=c2d(sysc,Ts)
A=sysd.den{1};
B=sysd.num{1};
B=B(2:end); k=1;

phi=[0.124 -0.0176 -0.024];
m=sd2spec(phi);
c=sfak(m);
vare=c(1)^2;
C=c/c(1);
if dets, vare=0; end;
%--------------------------------------------------------------------------

[As,Bs,Cs,Ds]=armax2ss(A,B,k,C); 
Bs(:,2)=Bs(:,2)*sqrt(vare);
Ds(:,2)=Ds(:,2)*sqrt(vare);
ns=length(As); Xs=zeros(ns,1);
