%---- Problem 1 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 1.1 -------------------------------------------------
ques('1.1');

disp('Simulating (wb1)');
dets=1;
wb1
z=data(:,3:4);
disp('Estimated ARX model');
th=arx(z,[1 1 1])

prnt

%% -- Question 1.2 -------------------------------------------------
ques('1.2');

disp('Simulating (wb1)');
dets=0;
wb1
z=data(:,3:4);
disp('Estimated ARX model');
th=arx(z,[1 1 1])

[par,P]=th2par(th);
estpres(par,P);

prnt

%% -- Question 1.3 -------------------------------------------------
ques('1.3');

disp('Simulating (wb1)');
dets=0;
wb1
z=data(:,3:4);
err=pe(z,th);

clf;
plot(err); grid;
disp('Residual sum of squares');
J=sum(err.^2)

resid(th,z);

prnt
disp('Test data set');
disp('Simulating (wb1)');
dets=0;
wb1;
z=data(:,3:4);
err=pe(z,th);

disp('Sum of squares test');
J=sum(err.^2)

prnt

%% -- Question 1.4 -------------------------------------------------
ques('1.4');

disp('Bode plot for estimated and true model');
th0=idpoly(A,[0 B],C);
bode(th0,th,'sd',2.58)

prnt

%% -- Question 1.5 -------------------------------------------------
ques('1.5');

disp('Simulating (wb1)');
dets=0; wb1; z=data(:,3:4);
disp('Empirical transer function');
th_etfe=etfe(z)
bode(th0,th_etfe)

prnt

%% -- Question 1.6 -------------------------------------------------
ques('1.6');

disp('Simulating (wb1)');
dets=0; wb1; z=data(:,3:4);
disp('Spectral analysis');
th_spa=spa(z)
bode(th0,th_spa)

