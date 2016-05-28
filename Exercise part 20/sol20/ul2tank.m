function [M,B,A]=ul2tank(w0)
% [M,B,A]=ul2tank(w0)
%
% \dot{x}=M\sqrt{x}+Bu
%
tank_par

a1=ao*so*sqrt(2*g)/C;
a2=al*sl*sqrt(2*g)/C;

M=[-a1 a2; a1 -2*a2];
B=[0 1/C]';

if nargin>0, % A linear model (A: system matrix)
 [u0,x0]=offset(w0);
 A=M*diag(0.5./sqrt(x0));
 end
