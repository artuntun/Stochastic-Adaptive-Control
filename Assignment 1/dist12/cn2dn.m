function [Rd,Ad]=cn2dn(Ac,Rc,ts)
% Usage: [Rd,Ad]=cn2dn(Ac,Rc,ts)
%
% Function file to find discrete system covariance matrix,
% given the continuous state space system equation:
%
% Continuous system
% .
% x(t) = Ac*x(t) + w(t);  Intensity of w: Rc
%
% ts is the sample time
%
% Discrete target system
%
% x(i+1) = Ad*x(i) + w(i); E{w*w'} = Rd
%


% Soederstroem p.111.

n=max(size(Ac));
a=[Ac Rc; zeros(n,n) -Ac'];
f=expm(a*ts);
Ad=f(1:n,1:n);
f12=f(1:n,n+1:2*n); f22=f(n+1:2*n,n+1:2*n);
Rd=f12*inv(f22);
Rd=0.5*(Rd+Rd');

