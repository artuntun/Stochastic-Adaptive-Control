function [u0,X0]=offset(w)
% [u0,X0]=offset(w)
%
% w=x1
%
% [x1;x2] = [h2;h1-h2];

tank_par

x1=w;
u0=ao*s0*sqrt(2*g*x1);
x2=(u0/(s1*al))^2; x2=x2/(2*g);
X0=[x1; x2];

