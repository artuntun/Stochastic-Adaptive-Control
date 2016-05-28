function plt2(nr)

global data 

figure(1);   
%set(gcf,'Position',[10 720 560 420]);
set(gcf,'DefaultTextInterpreter','tex');

t=data(:,1);
xh1=data(:,8);
xh2=data(:,9);
ns=min(size(data));
disp(size(data));
return
xs1=data(:,10);
xs2=data(:,11);

subplot(211);
plot(t,xh1,t,xs1); grid; ylabel('X_1 (est,true)'); xlabel('t in sec');
ax=axis; axis([min(t) max(t) ax(3) ax(4)]);
legend('est','true',0);

subplot(212);
plot(t,xh2,t,xs2); grid; ylabel('X_2 (est,true)'); xlabel('t in sec');
ax=axis; axis([min(t) max(t) ax(3) ax(4)]);
legend('est','true',0);

J=[(xh1-xs1)'*(xh1-xs1) (xh2-xs2)'*(xh2-xs2)];
J=J/length(xs1);
fprintf('Je = %f %f \n',J(1),J(2));

if nargin>0,
 figure(2);
 h1=data(:,nr);
 plot(t,h1)
end
