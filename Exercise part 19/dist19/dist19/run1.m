clear all;
clf;

wb
y=data(:,3:4);
u=data(:,5);
dat=iddata(y,u,5);
%plot(dat)

na=[2 2; 2 2];
% na=[1 2; 0 2];
na=[3 3; 3 3];
nb=[1;1];
k=[1; 1];
ns=[na nb k];
th=arx(dat,ns);
present(th)