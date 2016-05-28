load ../dist19/dat1
plt
 print fig51.pps
pause
y=data(:,4);
u=data(:,5);
z=[y u];
Ze=dtrend(z);
th=armax(Ze,[2 2 2 1]);
present(th);
[parm,P]=th2par(th);
estpres(parm,P);
pause

resid(Ze,th);
 print fig52.pps
pause

zpplot(th2zp(th,0),2.58);
 print fig53.pps
pause
zpplot(th2zp(th,1),2.58);
 print fig54.pps

