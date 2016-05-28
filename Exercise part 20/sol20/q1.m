%---- Problem 1 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 1.1-3------------------------------------------------
ques('1.1-3');

load dat1
plt
title('Estimation data');
y=data(:,4); 
u=data(:,5); 
z=[y u];
Ze=dtrend(z);
prnt

load dat2
plt
title('Test data');
y=data(:,4); 
u=data(:,5); 
z=[y u];
Zt=dtrend(z);
prnt

clf;
% Does it ALL - get familiar with the code
[ns,le,lt]=sfind(3,Ze,Zt,2);

prnt

%% -- Question 1.4 -------------------------------------------------
ques('1.4');

th=forward(Ze);
figure(1);
zpplot(th2zp(th,0),2.5758)
prnt

figure(2);
zpplot(th2zp(th,1),2.5758)

prnt

%% -- Question 1.5 -------------------------------------------------
ques('1.5');

Ze=dtrend(z);
th=armax(Ze,[2 2 2 1]);
present(th);
[parm,P]=th2par(th);
estpres(parm,P);

prnt

resid(Ze,th);

prnt

zpplot(th2zp(th,0),2.58);
 
prnt

zpplot(th2zp(th,1),2.58);

prnt

%% -- Question 1.6 -------------------------------------------------
ques('1.6');

w0=19;
[As,Bs,Cs,Ds,U0,X0,R1,R2]=sysinit(w0); % Determine linear model
ns=length(As);

[b,a]=ss2tf(As,Bs,Cs,Ds,1)
P=dare(As',Cs',R1,R2);
%[m1,p1,z1,e1]=dlqe(As,eye(length(As)),Cs,R1,R2);
K=As*P*Cs'*inv(R2+Cs*P*Cs');
[c,a]=ss2tf(As,K,Cs,1,1)

prnt

%% -- Question 1.7 -------------------------------------------------
ques('1.7');

load dat3
y=data(:,4); 
u=data(:,5); 
z=[y u];
Ze=dtrend(z);

load dat4
y=data(:,4); 
u=data(:,5); 
z=[y u];
Zt=dtrend(z);

th=armax(Ze,[2 2 2 1]);
present(th);
[parm,P]=th2par(th);
estpres(parm,P);
resid(Zt,th);


