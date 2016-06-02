function plt(nr)

global sdata 

figure(1);   
%set(gcf,'Position',[10 720 560 420]);
%set(gcf,'DefaultTextInterpreter','tex');

t=sdata(:,1);
wt=sdata(:,2);
yt=sdata(:,3);
ut=sdata(:,4);
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
 h1=sdata(:,nr);
 plot(t,h1)
end


function [ud,td]=u2d(u,t)
% usage [ud,td]=u2d(u)
% or    [ud,td]=u2d(u,t)
%
% This is a preprocesser for plotting og discrete data
%
% Transform:
%
% u1, u2, u3
% t1, t2, t3
%
% into:
%
% u1 u1 u2 u2 u3 
% t1 t2 t2 t3 t3 
%
% which is usefull in connection to dicrete data

if nargin==1,
 t=0:length(u)-1;
 end

u=u(:); t=t(:);
ud=kron([1;1],u');
ud=ud(:);
ud=ud(1:end-1);
t1=t(2:end);
td=kron([1;1],t1');
td=td(:);
td=[t(1); td];
 

%n=max(size(u));
%y=zeros(2*n,1);
%t=zeros(2*n,1);
%for i=1:n,
 %y(2*i-1)=u(i);
 %t(2*i-1)=i;
 %y(2*i)=u(i);
 %t(2*i)=i+1;
 %end
%ud=y; td=t-1;
%end
