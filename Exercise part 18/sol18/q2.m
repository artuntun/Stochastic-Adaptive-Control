%---- Problem 2 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 2.1 -------------------------------------------------
ques('2.1');

% Create system
F = 1;
B = [1 0.1];
C = [1 -0.8];
D = 1;
A = [1 -1.5 0.7];

sys = idpoly(A,[0 B],C,D,F)
N = 1000;
s2 = 0.1;

u = iddata([],idinput(N,'prbs'));
e1 = iddata([],sqrt(s2)*randn(N,1));
e2 = iddata([],sqrt(s2)*randn(N,1));

simdata = [sim(sys, [u e1]) ,u ];
simdata_test = [sim(sys, [u e2]) ,u ];
ns = [2 2 1];
sys_est = arx(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

%% -- Question 2.2 -------------------------------------------------
ques('2.2');

disp('ARMAX method');
ns = [2 2 1 1];
sys_est = armax(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

%% -- Question 2.3 -------------------------------------------------
ques('2.3');

s2 = 1e-3;
s2=1e-7;
s2=0;
disp('ARMAX method');
e1 = iddata([],sqrt(s2)*randn(N,1));
e2 = iddata([],sqrt(s2)*randn(N,1));
simdata = [sim(sys, [u e1]) ,u ];
simdata_test = [sim(sys, [u e2]) ,u ];
sys_est = armax(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

%% -- Question 2.4 -------------------------------------------------
ques('2.4');

disp('OE method');
ns = [2 2 1];
sys_est = oe(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)

prnt

disp('IV4 method');
ns = [2 2 1];
sys_est = iv4(simdata,ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)
resid(sys_est, simdata_test)










