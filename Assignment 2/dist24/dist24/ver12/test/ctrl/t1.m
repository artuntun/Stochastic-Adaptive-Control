a=[1 -1.5 0.7];
b=[1 0.5];
%k=1;
c=polmul([1 0.3],[1 -0.7]);

[r,s,g]=dsnmv(a,b,k,c)
q=0;
pause

[ap,bp,kp]=clloop(a,b,k,c,r,s,q,2)
[ap,bp,kp]=clloop(a,b,k,c,r,s,q,4)
