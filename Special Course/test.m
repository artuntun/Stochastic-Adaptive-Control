%%Special Course System Identification
%% Simulating a 1st order system
startup
wb
%% Fit the model in ARMAX model
ye = data(:,3); 
ue = data(:,4);
ze=[ye ue];
Ze = dtrend(ze);
SYS = armax(ze, [1 1 0 1])
present(SYS)
[parm p] = th2par(SYS);
estpres(parm, p)
resid(SYS, Ze)

%%

SYS = n4sid(ze,1)
