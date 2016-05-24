clc; disp('Test af acf (sammen acfar, acfma og acfss)')

mode=3; % mode: 0, sampl. of cont sys: 1, AR-process: 2, MA-process

if mode==0,
 disp('Sampling af kont. process.')
 d=0.1;
 w=1;
 ts=0.3;
 a=[1 2*d*w w^2];
 b=[0 0 w^2];
 v=1;
 [a,c,v]=nc2d(a,b,v,ts)
 disp(trfvar(a,c)*v)
elseif mode==1,
 disp('AR-test')
 a=[1 -0.98 0.81];
 c=1;
 v=1;
elseif mode==2,
 disp('MA-test')
 c=[1 -0.98 0.81];
 a=1;
 v=1;
elseif mode==3,
 a=[1 0.7 0.5 -0.3];
 c=[1 0.3 0.2 0.1];
 v=1;
end

n=5;

[ry,rye,t]=acf(a,c,v,n);
disp('acf finished');

if mode==1,
 [ry2,rye2,t]=acfar(a,v,n);
 disp('acfar finished')
elseif mode==2,
 [ry2,rye2,t]=acfma(c,v,n);
 disp('acfma finished')
end

[a,b,c,d]=trf2ss(a,c);
r1=b*v*b';
r2=d*v*d';
r12=b*v*d';

[ry1,t]=acfss(a,r1,c,r2,r12,n);
disp('acfss finished')

clc;
disp('    t            covar                            crosscovar   ')
if mode==1,
 disp('                 acf    acfss      acfar  ---  acf     acfar')
 disp([t' ry' ry1' ry2' rye' rye2'])
elseif mode==2,
 disp('                 acf    acfss      acfma  ---  acf     acfma')
 disp([t' ry' ry1' ry2' rye' rye2'])
elseif mode==3,
 disp('                 acf    acfss')
 disp([t' ry' ry1' ])
end



