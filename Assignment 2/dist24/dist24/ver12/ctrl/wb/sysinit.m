function [A,B,k,C,s2]=sysinit
% Initialise system, ie. determine models and constants.
% 
% Usage: [A,B,k,C,s2]=sysinit
%

global t t0 Tnext Ts	% Time administration
global As Bs Cs Ds Xs 	% D-time Linear model

Ts=1;

%--------------------------------------------------------------------------
A=[1 -1.5 0.7];
B=[1 1.5];
k=1;
%C=[1 1.5 0.9];
%C=[1 0.3];
C=1;
%C=[1 1.5 0.9 0.1];
s2=0.01; % Variance of innovation
%s2=0;
%--------------------------------------------------------------------------

[As,Bs,Cs,Ds]=armax2ss(A,B,k,C); 
Bs(:,2)=Bs(:,2)*sqrt(s2);
Ds(:,2)=Ds(:,2)*sqrt(s2);
ns=length(As); Xs=zeros(ns,1);
