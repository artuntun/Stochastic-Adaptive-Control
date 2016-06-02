function plt(nr)

global data 

%set(gcf,'Position',[10 720 560 420]);
set(gcf,'DefaultTextInterpreter','tex');

if nargin==0,

 t=data(:,1);
 wt=data(:,2);
 yt=data(:,3);
 ut=data(:,4);
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

else,
 figure(2);
 h1=data(:,nr);
 plot(t,h1)
end
