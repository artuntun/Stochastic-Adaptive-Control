function [As,Bs,Cs,Ds,U0,X0]=sysinit(w0)
% Initialise system, ie. determine models and constants.
% 
% Usage: [As,Bs,Cs,Ds,U0,X0]=sysinit(w0)
%
% System matrices in D-time: As,Bs,Cs,Ds
% Steady state values: U0,X0
% Operation point: w0 (set point)

global t t0 Tnext Ts	% Time administration
global As Bs ds		% D-time L-model
global Ac Bc dc		% C-time L-model
global Xs
global spm              % question manager

tank_par

a1=ao*sigmao*sqrt(2*g)/C;
a2=al*sigmal*sqrt(2*g)/C;

if spm==11,
 fprintf('Offset in U and X \n');
 [U0,X0]=offset(w0)
else,
 [U0,X0]=offset(w0);
end;
Xs=X0;

%-----------------------------------------------------------------
% Continous time model
M=[-a1 a2; a1 -2*a2];
Ac=M*diag(0.5./sqrt(X0));
Bc=[0 1/C]';
dc=-(Ac*X0+Bc*U0);

if spm==12,
 fprintf('Eigenvalues for linear system\n');
 egv=eig(Ac)
 fprintf('and time constants \n');
 -1./egv 
end

%-----------------------------------------------------------------
% Discret time model
Ts=5;

[As,Bs]=c2d(Ac,Bc,Ts);
Cs=[1 0];
Ds=0;
ds=(eye(length(As))-As)*X0-Bs*U0;

if spm==13,
 fprintf('Total system matrix, ie. [As Bs; Cs Ds] \n');
 [As Bs; Cs Ds]
 fprintf('and eigenvalues \n');
 eig(As)
 return
end
