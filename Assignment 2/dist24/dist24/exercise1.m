%% Initialization
clear all
close all
startup

%% Question 1.1
load data1
% title('Estimation data');
ye = data(:,1); 
ue = data(:,2);
ze=[ye ue];
Ze = dtrend(ze);


load data2
yt = data(:,1);
ut = data(:,2);
zt = [yt ut];
Zt = dtrend(zt);

[ns,le,lt]=sfind(3,Ze,Zt,2);

%% Question 1.2
SYS = armax(Ze, [2 2 1 1])
present(SYS)
[parm p] = th2par(SYS);
estpres(parm, p)
resid(SYS, Ze)
pause;
resid(SYS, Zt)
%% pzmap of question 1.2
close all
% pzplot = iopzplot(SYS);
% showConfidence(pzplot)
zpplot(th2zp(SYS,1),2.58)
grid
zpplot(th2zp(SYS,0),2.58)
grid


