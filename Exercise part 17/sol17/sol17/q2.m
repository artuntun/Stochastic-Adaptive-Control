%---- Problem 2 ----------------------------------------------

%% Initialization
clear all
close all

pause on

%% -- Question 2.1 -------------------------------------------------
ques('2.1');

disp('Simulating (wb2)');
dets=1; wb2; z=data(:,3:4);

for i=1:3,
 th=arx(z,[i i 1])
 err=pe(z,th);
 J=sum(err.^2)
 [parm,P]=th2par(th);
 cond(P)
 estpres(parm,P)
 prnt
end


%% -- Question 2.2 -------------------------------------------------
ques('2.2');

disp('Simulating (wb2) s2=0.1');
dets=2; wb2; z=data(:,3:4);

for i=1:3,
 th=arx(z,[i i 1])
 err=pe(z,th);
 J=sum(err.^2)
 [parm,P]=th2par(th);
 cond(P)
 estpres(parm,P)
 prnt
end

disp('Simulating (wb2) s2=1');
dets=3; wb2; z=data(:,3:4);

for i=1:3,
 th=arx(z,[i i 1])
 err=pe(z,th);
 J=sum(err.^2)
 [parm,P]=th2par(th);
 cond(P)
 estpres(parm,P)
 prnt
end


