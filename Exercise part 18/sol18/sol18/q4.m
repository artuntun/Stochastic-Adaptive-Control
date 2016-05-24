%---- Problem 4 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 4.1 -------------------------------------------------
ques('4.1');

% Create system
A = [1 -0.8];
B = [1 -1.5 0.7];
C = [1 0.2];
D = [1 -0.8];
F = [1 0.1];

disp('Variance of noise e_t');
s2yu = trfvar(polmul(F,A),B);
s2 = s2yu/trfvar(polmul(D,A),C)

prnt


%% -- Question 4.2 -------------------------------------------------
ques('4.2');

N= 1000;

sys = idpoly(A,[0 B],C,D,F)
N = 1000;

u = iddata([],idinput(N,'prbs'));
e1 = iddata([],sqrt(s2)*randn(N,1));
e2 = iddata([],sqrt(s2)*randn(N,1));

simdata = [sim(sys, [u e1]) ,u ];
simdata_test = [sim(sys, [u e2]), u ];
disp('PEM method');
ns = [1 3 1 1 1 1];
sys_est = pem(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

%% -- Question 4.3 -------------------------------------------------
ques('4.3');

disp('Equivalent armax model');
Aarmax = polmul(polmul(A,F),D);
Barmax = polmul(B,D);
Carmax = polmul(C,F);
sysarmax = idpoly(Aarmax,[0 Barmax],Carmax,1,1)

disp('ARMAX method');
ns = [3 4 2 1];
sys_est = armax(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

%% -- Question 4.4 -------------------------------------------------
ques('4.4');

disp('OE method');
ns = [3 2 1];
sys_est = oe(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

disp('IV method');
ns = [2 3 1];
sys_est = iv4(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)