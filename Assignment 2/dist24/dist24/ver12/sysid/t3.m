a=[1 -1.5 0.7];
b=[1 0.5];
c=[1 0.2 0.1];
s2=0.1;
thi=idpoly(a,b,c,'nk',1)


ut=sqwave(100,15);
et=randn(100,1)*s2;
y=idsim(thi,[ut et]);
