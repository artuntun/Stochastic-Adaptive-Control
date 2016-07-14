function [A,B,k,C,s2]=sysinit2(dets)
% Initialise system, ie. determine models and constants.
% 
% Usage: [A,B,k,C,s2]=sysinit
%
% where A, B, C and k are the usual polynomials in an ARMAx description.
% s2 is the innovation variance.

global t t0 Tnext Ts	% Time administration
global As Bs Cs Ds Xs 	% D-time Linear model

%--------------------------------------------------------------------------

Ts=1;
A=[1 -1.5 0.7];
B=[1 0.1];
C=[1];
k=1;
if dets==1, s2=0; end;
if dets==2, s2=0.1; end;
if dets==3, s2=1; end;

%--------------------------------------------------------------------------
% In the lines above A,B,k and C should be determined.
%--------------------------------------------------------------------------
%if dets, s2=0; end; % set s2=0 if we are running a deterministic simulation.
[As,Bs,Cs,Ds]=armax2ss(A,B,k,C); 
Bs(:,2)=Bs(:,2)*sqrt(s2);
Ds(:,2)=Ds(:,2)*sqrt(s2);
ns=length(As); Xs=zeros(ns,1);
