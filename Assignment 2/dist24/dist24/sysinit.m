function [Am,Bm,km,Cm,s2]=sysinit(dets)
% Initialise system, ie. determine models and constants.
% 
% Usage: sysinit
%

global t Ts;                % Time administration
global thS fiS pilS se; 	% D-time Linear model
global datath0;

Ts=1.5;

shw=0;
%--------------------------------------------------------------------------
% A=[1 -1.5 0.7];
% B=[1 0.5];
A = [1 -2.36 2.16 -0.74];
B=[0.06 0 0];

k=1;
C=1;
s2=0.001;

if dets, s2=0; end;
se=sqrt(s2);
%--------------------------------------------------------------------------
thS=[A(2:end) B C]';
pilS=[length(A)-1 length(B)]; 
pilS=[0 cumsum(pilS)]+1;
fiS=zeros(size(thS));
%--------------------------------------------------------------------------
Am=A; Bm=B; km=k; Cm=C;
%--------------------------------------------------------------------------
datath0=[];
%--------------------------------------------------------------------------

if shw,
 thS'
 pilS
 fiS'
 pause
end
