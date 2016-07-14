function [A,B,k,C,V]=ss2armax(As,Bs,Cs,Ds,R1,R2)
% Usage [A,B,k,C,V]=ss2armax(As,Bs,Cs,Ds,R1,R2)
%
% Converts a state space description:
%
% x' = As*x + Bs*u + v      v in N(0,R1)
%  y = Cs*x + e             e in N(0,R2)
%
% into an ARMAX (external) form
%
% A(d)y = d^k*B(d)u + C(d)*err   err in N(0,V)
 
% Programmed 2002 by Niels K. Poulsen
% Informatics and Mathematical Modelling,
% Technical University of Denmark

% testfile: .m
% home: sys

[Kord,P]=dlqe(As,eye(size(As)),Cs,R1,R2);
K=As*P*Cs'*inv(Cs*P*Cs'+R2);

[A,C]=ss2trf(As,K,Cs,1);        % Find trf from epsilon
[A,B]=ss2trf(As,Bs,Cs,Ds);      % Find trf from control (same A - hopefully)
[B,k]=polclr(B);                % Extracting the timedelay from B
V=R2+Cs*P*Cs';                 % Variance of epsilon

