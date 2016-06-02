function [A,B,C,D,R1a,Cm,R2]=tsystem
% Usage: [A,B,C,D,R1a,Cm,R2]=tsystem
%
%   x[k+1] = Ax+Bu+Bv
%   y = Cx+Du      controlled output
%   ym = Cmx+e     measured output
%   E{vv'} = R1a
%   E{ee'} = R2
%

%-----------------------------------------------------------------
tank_par
a1=ao*sigmao*sqrt(2*g)/C;
a2=al*sigmal*sqrt(2*g)/C;
w0=19;
[U0,X0]=offset(w0);
%-----------------------------------------------------------------
% Continous time model
M=[-a1 a2; a1 -2*a2];
Ac=M*diag(0.5./sqrt(X0));
Bc=[0 1/C]';
ns=2;
%-----------------------------------------------------------------
% Discret time model
Ts=5;
[A,B]=c2d(Ac,Bc,Ts);
Cm=[1 1;1 0]; 	% Measured output
C=[1 0];	% controlled output
D=0;

R1a=70;
R2=eye(2)*0.75;
%-----------------------------------------------------------------
