%---- Problem 1 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 1.1 -------------------------------------------------
ques('1.1');

% Create system
F = [1 -1.5 0.7];
B = [1 0.5];
sys = idpoly(1,[0 B],1,1,F)

N = 1000

u = iddata([],idinput(N,'prbs'));

disp('Theoretical contribution from deterministic input')
s2yu = trfvar(F,[0 B])
disp('Variance of noise process:');
s2 = s2yu/100

prnt

%% -- Question 1.2 -------------------------------------------------
ques('1.2');

% Create input data
e = iddata([],sqrt(s2)*randn(N,1));
simdata = [sim(sys, [u e]) ,u ];
ns = [2 2 1];
disp('ARX approximation');
sys_est = arx(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm, p)

% Test data
e_test = iddata([],sqrt(s2)*randn(N,1));
simdata_test = [sim(sys_est, [u e_test]) , u];
resid(sys_est, simdata);

prnt

%% -- Question 1.3 -------------------------------------------------
ques('1.3');

disp('IV4 method');
sys_est = iv4(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm,p)

% Test 
simdata_test = [sim(sys_est, [u e_test]) , u];
resid(sys_est, simdata_test);

prnt

%% -- Question 1.4 -------------------------------------------------
ques('1.4');

disp('OE method');
sys_est = oe(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm,p)

% Test 
simdata_test = [sim(sys_est, [u e_test]) , u];
resid(sys_est, simdata_test);

prnt

%% -- Question 1.5 -------------------------------------------------
ques('1.5');

disp('Variance of eta');
C = 1; D = [1 -0.9];
s2 = s2/trfvar(D,C)

prnt

%% -- Question 1.6 -------------------------------------------------
ques('1.6');

sys = idpoly(1,[0 B],C,D,F)
e = iddata([],sqrt(s2)*randn(N,1));
simdata = [sim(sys, [u e]) ,u ];

ns = [2 2 1]
disp('ARX method');
sys_est = arx(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm,p)

prnt

disp('OE method');
sys_est = oe(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm,p)

prnt

disp('IV4 method');
sys_est = iv4(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm,p)

prnt

disp('PEM method');
ns = [0 2 0 1 2 1];
sys_est = pem(simdata, ns);
present(sys_est)
[parm p] = th2par(sys_est);
estpres(parm,p)


