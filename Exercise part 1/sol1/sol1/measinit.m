function measinit(sysflag) 

global Ts Tnext t t0

timer=[0 0 0 3600 60 1]';
if sysflag==0,
 das_wri1(2,49);
 das_wri1(11,0);
 t=clock*timer;
 t0=t;
 Tnext=t;
 disp('Measurement system started')
else
 t=0;
 t0=t;
 Tnext=t;
end
