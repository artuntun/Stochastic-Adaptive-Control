function measinit(sysflag,X0) 

global Ts Tnext t t0
global Xs

timer=[0 0 0 3600 60 1]';
if sysflag==0,
 das_wri1(2,49);
 das_wri1(11,0);
 t=clock*timer;
 t0=t;
 Tnext=t;
 disp('Measurement system started')
else
 Xs=X0;
 t=0;
 t0=t;
 Tnext=t;
end
