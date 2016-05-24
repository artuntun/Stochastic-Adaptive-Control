clear all;
close all;
clf;
warning off;

wb
y(:,1)=data(:,3);
y(:,2)=data(:,4);

u=data(:,5);

figure;
plot(y);
title('Outputs');

figure;
plot(u);
title('Inputs');

% Detrend:
y=detrend(y,'constant');
u=detrend(u,'constant');

dat=iddata(y,u,5);
%plot(dat)

na=[2 2; 2 2];
% na=[1 2; 0 2];
na=[3 3; 3 3];
nb=[1;1];
k=[1; 1];
ns=[na nb k];
th=arx(dat,ns);
present(th);
