%---- Problem 2 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 2.1 -------------------------------------------------
ques('2.1');

Ac=[1 1 0];
Bc=100;
sysc = tf(Bc,Ac)

prnt;

%% -- Question 2.2 -------------------------------------------------
ques('2.2');

Ts=1/10;
sysd=c2d(sysc,Ts)

% write polynomial in ascending order of q
A=sysd.den{1};
B=sysd.num{1};
B=B(2:end); 
k=1;

prnt;

%% -- Question 2.3 -------------------------------------------------
ques('2.3');

phi=[0.124 -0.0176 -0.024];
m=sd2spec(phi);
c=sfak(m);
vare=c(1)^2
C=c/c(1)
disp('ARMAX description');
A, B, k, C, vare

prnt;

%% -- Question 2.4 -------------------------------------------------
ques('2.4');

disp('Implemented in wb24.m')
wb24

prnt;

%% -- Question 2.5 -------------------------------------------------
ques('2.5');

disp('Implemented in wb25.m')
wb25

prnt;

%% -- Question 2.6 -------------------------------------------------
ques('2.6');

disp('Implemented in wb26.m')
disp('Change dets=0 for stochastic sim');
wb26

prnt;

%% -- Question 2.7 -------------------------------------------------
ques('2.7');

disp('Implemented in wb27.m')
disp('Change dets=0 for stochastic sim');
wb27

prnt;

%% -- Question 2.8 -------------------------------------------------
ques('2.8');

disp('Implemented in wb28.m')
disp('Change dets=0 for stochastic sim');
wb28

prnt;

%% -- Question 2.9 -------------------------------------------------
ques('2.9');

disp('Implemented in wb29.m')
disp('Change dets=0 for stochastic sim');
wb29

prnt;

%% -- Question 2.10 ------------------------------------------------
ques('2.10');

disp('Implemented in wb210.m')
disp('Change dets=0 for stochastic sim');
wb210

prnt;

%% -- Question 2.11 ------------------------------------------------
ques('2.11');

disp('Implemented in wb211.m')
disp('Change dets=0 for stochastic sim');
wb211

prnt;



