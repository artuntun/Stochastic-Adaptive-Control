function dx=d2tank(t,x,flag,u)
% Determine derivative of nonlinear continous time 
% model, ie.
%
% dx=f(t,x,u)

tank_par

%q1=sigmal*al*real(sqrt(2*g*abs(x(2))))*sign(x(2)); % Robust implementation
%q2=sigmao*ao*real(sqrt(2*g*max(x(1),0)));

q1=sigmal*al*sqrt(2*g*x(2));
q2=sigmao*ao*sqrt(2*g*x(1));

dh1=(u-q1)/C;	
dh2=(q1-q2)/C;
dx=[dh2; dh1-dh2];


