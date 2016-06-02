%---- Problem 2 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 2.1 -------------------------------------------------
ques('2.1');

C=[1 .6];
A=[1 -1.4 .6];
sigma2=0.7;

et=randn(1,500)*sqrt(sigma2);

Y = dlsim(C,A,et);
plot(Y); hold on

prnt

%% -- Question 2.2 -------------------------------------------------
ques('2.2');

k=3
disp('Predictor');
[ap,bp,g] = dsnprd(A,C,k)

prnt


%% -- Question 2.3 -------------------------------------------------
ques('2.3');

Yh=dlsim(bp,ap,Y);

Yh(1:500) = [zeros(k-1,1); Yh(1:500-(k-1))];

figure
plot(Y); hold on
plot(Yh,'r'), hold off;

legend('y_t','yh_t')

disp('Variance of prediction error');
pred_err=var(Y(k+1:500)-Yh(k+1:500))

prnt

%% -- Question 2.4 -------------------------------------------------
ques('2.4');

k=5
disp('Predictor');
[ap,bp,g] = dsnprd(A,C,k)

Yh=dlsim(bp,ap,Y);
Yh(1:500) = [zeros(k-1,1); Yh(1:500-(k-1))];

figure
plot(Y); hold on
plot(Yh,'r'), hold off;

disp('Variance of prediction error');
pred_err=var(Y(k+1:500)-Yh(k+1:500))

