%---- Problem 1 ----------------------------------------------



%% Initialization

clear all

close all



pause on



%% -- Question 1.1 -------------------------------------------------

ques('1.1');



% ARMA process

A=[1 -1.5 0.7];

C=[1 -0.2 0.5];

na=(length(A)-1);

nc=(length(C)-1);

sigma2=0.1;



disp('First 5 coefficient of the impulse response');

[Y,X]=dimpulse(C,A);
dstep(C,A)
Hn5=Y(1:5)

prnt;



%% -- Question 1.2 -------------------------------------------------

ques('1.2');



k=2;

[G,S]= poldiopk(A,k,C)





prnt



%% -- Question 1.3 -------------------------------------------------

ques('1.3');



disp('Error polynomial');

E=polsum(C,-polmul(A,G)) %E=q^-k*S



prnt





%% -- Question 1.4 -------------------------------------------------

ques('1.4');



disp('Solution for k=3');

k=3

[G3,S3]=poldiopk(A,k,C)

E=polsum(C,-polmul(A,G3)) %E=q^-k*S



prnt



%% -- Question 1.5 -------------------------------------------------

ques('1.5');





k=2

B = [1 -0.5]; nb=1;

Bbar = [zeros(1,k) B];



nx=(k+nb)-1;         %Order of G

ny=max(na-1,nc-k);   %Order of S



show = 1;



[G,S]=dioph(A,Bbar,C,nx,ny,show)

