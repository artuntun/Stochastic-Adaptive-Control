nstp=200;
spr=sqrt(0.1);


a=[1 -0.95];
b=[1 0.5];
c=[1 1.5 0.7];
f=[1 -0.7];
d=[1 -0.4];
k=1;


m0=idpoly(a,b,c,d,f,'nk',k);
u=prbs(nstp,20);
e=randn(nstp,1)*spr;
y=idsim(m0,[u e]);

th=forward([y u])
