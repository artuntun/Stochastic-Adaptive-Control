a=[1 -1.5 0.7];
b=[1 0.5];
k=1;
c=polmul([1 0.3],[1 -0.7]);
c=1;

[q,r,s,g]=dsnmv0(a,b,k,c)

for i=1:4,
 i
 [ap,bp,kp]=clloop(a,b,k,c,r,s,q,i);
 kp
 tf(bp,ap,1)
 pause
end
