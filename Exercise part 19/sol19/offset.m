function [u0,X0]=offset(w0)
% [u0,X0]=offset(w0)
%
% w=x1
%
% [x1;x2] = [h2;h1-h2];

tank_par

x1=w0;
u0=ao*sigmao*sqrt(2*g*x1);
x2=(u0/(sigmal*al))^2; x2=x2/(2*g);
X0=[x1; x2];

