%% Initialization
clear all
close all
pause on

format compact
warning off
    path(path,'ver12/pol');
    path(path,'ver12/sys');
    path(path,'ver12/sig');
    path(path,'ver12/plt');
    path(path,'ver12/ctrl');
    path(path,'ver12/sysid');

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
SYS = armax(Ze, [3 3 1 1])
present(SYS)
[parm p] = th2par(SYS);
estpres(parm, p)
% resid(SYS, Ze)
% pzmap(SYS,'sd',2.5758)
