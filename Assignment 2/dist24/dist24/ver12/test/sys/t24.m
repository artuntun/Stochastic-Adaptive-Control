disp('Test af acfss, samt acfar')
% Test af acfss
% test sammen med t22 (acfar)
a=[ 1 0.4 0.3];
c=1;
v=1;

n=3;

[ry,rye,t]=acfar(a,v,n);


[a,b,c,d]=trf2ss(a,c);
r1=b*v*b';
r2=d*v*d';
r12=b*v*d';

[ry1,t]=acfss(a,r1,c,r2,r12,n);

%echo on
disp([t' ry1' ry'])
%echo off
