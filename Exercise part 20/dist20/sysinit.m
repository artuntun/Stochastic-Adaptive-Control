function [As,Bs,Cs,Ds,U0,X0,R1,R2]=sysinit(w0)
% Initialise system, ie. determine models and constants.
% 
% Usage: [As,Bs,Cs,Ds,U0,X0,R1,R2]=sysinit(w0)
%
% System matrices in D-time: As,Bs,Cs,Ds
% Steady state values: U0,X0
% Operation point: w0 (set point)

global t t0 Tnext Ts	% Time administration
global As Bs ds		% D-time L-model
global Cs Ds            % D-time L-model
global Ac Bc dc		% C-time L-model
global Xs		% State vector in simulations
global An1 Bn1 Cn1 Dn1 Xn1 n1	% Process noise model
global An2 Bn2 Cn2 Dn2 Xn2 n2	% Measurement noise model

tank_par

a1=ao*so*sqrt(2*g)/C;
a2=al*sl*sqrt(2*g)/C;

[U0,X0]=offset(w0);
Xs=X0;
ns=2;
%-----------------------------------------------------------------
% Continous time model
M=[-a1 a2; a1 -2*a2];
Ac=M*diag(0.5./sqrt(X0));
Bc=[0 1/C]';
dc=-(Ac*X0+Bc*U0);

%-----------------------------------------------------------------
% Discret time model
Ts=5;
Ts=25;

[As,Bs]=c2d(Ac,Bc,Ts);
Cs=[1 0];
Ds=0;

ds=(eye(ns)-As)*X0-Bs*U0;
%-----------------------------------------------------------------
% Noise model
randn('seed',931316785);

var=0.1;
R2=eye(2)*0.1;
R1=eye(2)*0.1;

n2=[0 2 2]; % nx, nu, ny
%An2=zeros(n2(1),n2(1));
%Xn2=zeros(n2(1),1);
%Bn2=zeros(n2(1),n2(2));
%Cn2=zeros(n2(3),n2(1));
%Dn2=zeros(n2(3),n2(2));
Dn2=chol(R2)';
R2=R2(1,1);

n1=[0 ns ns]; % nx, nu, ny
%An1=zeros(n1(1),n1(1));
%Xn1=zeros(n1(1),1);
%Bn1=zeros(n1(1),n1(2));
%Cn1=zeros(n1(3),n1(1));
%Dn1=zeros(n1(3),n1(2));
Dn1=chol(R1)';

%-----------------------------------------------------------------
