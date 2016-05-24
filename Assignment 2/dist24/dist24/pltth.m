function pltth
global datath datath0

clf;
t=datath(:,1);
th=datath(:,2:end);
th0=datath0(:,2:end);

%figure(1);   
%set(gcf,'Position',[10 720 560 420]);
%set(gcf,'DefaultTextInterpreter','tex');

plot(t,th,t,th0,'--'); 
grid; ylabel('\theta'); xlabel('t in sec');
ax=axis; axis([min(t) max(t) -2 2]);
legend('\theta',0);

