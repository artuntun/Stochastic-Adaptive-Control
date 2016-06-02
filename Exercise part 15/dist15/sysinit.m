function [A,B,k,C,vare]=sysinit(dets)
% Initialise system, ie. determine models and constants.
% 
% Usage: [A,B,k,C,vare]=sysinit(dets)
%
% if dets==1 you will get a deterministic simulation

global t t0 Tnext Ts	% Time administration
global As Bs Cs Ds Xs 	% D-time Linear model

if nargin<1,
 dets=0;
end;

Ts=0.1;

%--------------------------------------------------------------------------
% Lines to be changed.
A=[1 -1.5 0.7];
B=[1 0.5];
k=1;
C=[1 -0.9 0.18];
vare=0.1;
%--------------------------------------------------------------------------

if dets, vare=0; end;
[As,Bs,Cs,Ds]=armax2ss(A,B,k,C); 
Bs(:,2)=Bs(:,2)*sqrt(vare);
Ds(:,2)=Ds(:,2)*sqrt(vare);
ns=length(As); Xs=zeros(ns,1);
