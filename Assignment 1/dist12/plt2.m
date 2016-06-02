function plt2(P)
%Usage: plt2(P)
%
% Plots the estimate and their confidence interval
% Input: error variance (matrix)

if nargin<1,
 help plt2
end

frac=2.5758;

global edata 

%set(gcf,'Position',[10 720 560 420]);
set(gcf,'DefaultTextInterpreter','tex');

t=edata(:,1);

% 1 | 2 3 4 | 5 6 7 | 8 9 10
% t |  xs   |  xh      err

J=[];
for i=1:3,
 figure(i);
 xs=edata(:,1+i);
 xh=edata(:,4+i);
 J=[J (xh-xs)'*(xh-xs)];
 p=P(i,i);
 plot(t,xs,t,xh,t,xh+frac*sqrt(p),t,xh-frac*sqrt(p));
 grid;
 ylabel(['X_',num2str(i),' (est,true)']); xlabel('t in sec');
 ax=axis; axis([min(t) max(t) ax(3) ax(4)]);
 legend('est','true',0);
end;

J=J/length(xs);
fprintf('Je = %f %f %f  \n',J(1),J(2),J(3));
