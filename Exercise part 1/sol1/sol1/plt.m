function plt(nr)

global data 

figure(1);   
%set(gcf,'Position',[10 720 560 420]);
%set(gcf,'DefaultTextInterpreter','tex');

t=data(:,1);
wt=data(:,2);
yt=data(:,4);
ut=data(:,5);
[wd,td]=u2d(wt,t);

subplot(211);
plot(t,yt,td,wd); grid; ylabel('Y, W'); xlabel('t in sec');
ax=axis; axis([min(t) max(t) ax(3) ax(4)]);
legend('y_t','w_t',0);

subplot(212);
ud=u2d(ut);
plot(td,ud); grid; ylabel('U'); xlabel('t in sec');
ax=axis; axis([min(t) max(t) ax(3) ax(4)]);
legend('u_t',0);

if nargin>0,
 figure(2);
 h1=data(:,nr);
 plot(t,h1)
end
