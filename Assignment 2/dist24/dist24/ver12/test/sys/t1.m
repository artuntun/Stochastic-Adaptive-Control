clc
fprintf('Test of trf2ss and ss2trf \n');

a=[1 -1.5 0.7]
b=[1 0.5]
k=1
[as,bs,cs,ds]=trf2ss(a,b)
[a1,b1]=ss2trf(as,bs,cs,ds)
pause

clc
a=[1 -1.5 0.7]
b=[1 0.5]
k=2
[as,bs,cs,ds]=trf2ss(a,b,k);
[a1,b1]=ss2trf(as,bs,cs,ds)
pause

clc
trfsys=tf(b,a,1)
[as,bs,cs,ds]=trf2ss(trfsys);
[a1,b1]=ss2trf(as,bs,cs,ds)
pause

clc
trfsys=tf(b,a,1)
sssys=trf2ss(trfsys);
[a1,b1]=ss2trf(sssys)
pause

clc
trfsys
tsys=ss2trf(sssys)
