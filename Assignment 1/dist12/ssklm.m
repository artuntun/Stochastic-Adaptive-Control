function [K,P]=ssklm(A,C,R1,R2,typ)
% Usage: [K,P]=ssklm(A,C,R1,R2,typ)
%
% Finds the stationary gain (K) and error variance (P) for a state space system:
%
% x' = Ax+Bu+v  v ~ N(0,R1)
% y  = Cx+e     e ~ N(0,R2)
%
% If typ==1, the results is related to an ordinary Kalman filter. Otherwise
% it is for a predictive Kalmanfilter

nx=length(A);
[k,p,z]=dlqe(A,eye(nx),C,R1,R2);
if typ==1,
 K=k; P=z;
else
 K=A*k; P=p;
end;
