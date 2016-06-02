function pltth
global datap 

clf;
t=datap(:,1);
p=datap(:,2:end);

%figure(1);   
%set(gcf,'Position',[10 720 560 420]);
%set(gcf,'DefaultTextInterpreter','tex');

plot(t,log(p));
grid; ylabel('log(trace(P))'); xlabel('t in sec');
%ax=axis; axis([min(t) max(t) -1.5 1.5]);
legend('P',0);

