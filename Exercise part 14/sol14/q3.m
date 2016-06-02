%---- Problem 3 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 3.1 -------------------------------------------------
ques('3.1');

A=[1 -1.5 0.7];
B=[1 -0.5];
C=[1 -0.2 0.5];

k=2;
sigma2=0.1;

na=(length(A)-1);
nc=(length(C)-1);

nx=k-1;             %Order of G
ny=max(na-1,nc-k);   %Order of S

disp('Uncontrolled variance of output:');
v=trfvar(A,C)*sigma2

prnt


%% -- Question 3.2 -------------------------------------------------
ques('3.2');

[G,S]=dioph(A,[zeros(k,1)' 1],C,nx,ny);

disp('MV0 controller found using dioph');
Q=C
R=polmul(B,G)
S, G

disp('MV0 controller found using dsnmv0');
[Q,R,S,G] = dsnmv0(A,B,k,C)

prnt

%% -- Question 3.3 -------------------------------------------------
ques('3.3');

disp('Variance of controlled output');
vc = trfvar(1,G)*sigma2

prnt

%% -- Question 3.4 -------------------------------------------------
ques('3.4');

disp('State space realization of controller');
[Ar,Br,Cr,Dr]=armax2ss(R,Q,0,S)

prnt

%% -- Question 3.5 -------------------------------------------------
ques('3.5');

disp('Transfer function from w_r to y_r');
[num,den]=ss2trf(Ar,Br,Cr,Dr,1,2)

prnt

%% -- Question 3.6/7------------------------------------------------
ques('3.6');
ques('3.7');

disp('Stochastic simulation');

wb

disp('Change settings in wb manually');
