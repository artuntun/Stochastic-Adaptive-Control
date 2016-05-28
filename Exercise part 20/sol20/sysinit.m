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

ttl=0; % test
if ttl==0,
tank_par

a1=ao*sigma_o*sqrt(2*g)/C;
a2=al*sigma_l*sqrt(2*g)/C;

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
%randn('seed',931316785);

var=0.1;
R2=eye(2)*0.1;
R1=eye(2)*0.1;

n2=[0 2 2]; % nx, nu, ny
%An2=zeros(n2(1),n2(1));
%Xn2=zeros(n2(1),1);
%Bn2=zeros(n2(1),n2(2));
%Cn2=zeros(n2(3),n2(1));
%Dn2=zeros(n2(3),n2(2));
Dn2=chol(R2);
R2=R2(1,1);

n1=[0 ns ns]; % nx, nu, ny
%An1=zeros(n1(1),n1(1));
%Xn1=zeros(n1(1),1);
%Bn1=zeros(n1(1),n1(2));
%Cn1=zeros(n1(3),n1(1));
%Dn1=zeros(n1(3),n1(2));
Dn1=chol(R1);

%-----------------------------------------------------------------
%P0=eye(ns);
%Xs=Xs+chol(P0)*randn(ns,1);

elseif ttl==1 % ttl - test 1
 a=[1 -1.5 0.7]
 b=[1 0.5]
 c=[1 0.3 0.1]
 s2=0.1; 
 [As,Bs,Cs,Ds]=armax2ss(a,b,1,c);
 s=sqrt(s2);
 Bs(:,2)=Bs(:,2)*s; Ds(:,2)=Ds(:,2)*s;
 Cs=Cs';
 ns=length(As);
 X0=zeros(ns,1); U0=0;
 Xs=zeros(ns,1);
 Ts=1;
 R1=0; R2=0;
elseif ttl==2, % ttl - test 2
 Ts=1;
 a=[1 -1.5 0.7];
 b=[1 0.5];
 [As,Bs,Cs,Ds]=trf2ss(a,b,1);
 Cs=Cs';
 ns=length(As);
 [As Bs; Cs Ds];
 R2=0.1; Dn2=chol(R2);
 R1=eye(ns)*0.05; Dn1=chol(R1);
 X0=zeros(ns,1); U0=0;
 Xs=zeros(ns,1);
end % ttl
