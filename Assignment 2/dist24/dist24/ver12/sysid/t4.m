% Test af sfind

nstp=100;
a=[1 -1.5 0.7];
b=[1 0.5];
c=[1 0.8];
f=1;
d=1;
ms=idpoly(a,b,c,d,f,'nk',1)

fprintf('Generating estimation set \n');
u=prbs(nstp,15);
e=randn(nstp,1)*0.1;
y=sim(ms,[u e]);
%idplot([y u]);

Ze=[y u];
%Ze=dtrend(Ze);

fprintf('Generating test set \n');
u=prbs(nstp,15);
e=randn(nstp,1)*0.1;
y=sim(ms,[u e]);
Zt=[y u];
%Zt=dtrend(Zt);
Zt=[];

clf;
fprintf('Searching th structure \n');
[ns,le,lt]=sfind(4,Ze,Zt,0);
forward(Ze)
th=pem(Ze,ns)
