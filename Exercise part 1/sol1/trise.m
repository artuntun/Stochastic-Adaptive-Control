function tr=trise(t,y,plt)
%Usage tr=trise(t,y,plt)
%
% Determine the rise time from a stepresponse.
% Notice: two definitions 10-90 % definition and
% resiproc max slope.

ys=y(1); yf=y(end); stps=yf-ys;
y10=ys+0.1*stps;
y90=ys+0.9*stps;

i1=min(find(y>y10));
i2=max(find(y<y90));

tr=(t(i2)-t(i1));
%tr=(t(i2)-t(i1))/stps;

Ts=t(2)-t(1);
dy=diff(y);
[mdy,i3]=max(dy); 
tr=[tr;Ts*stps/mdy];

if nargin>2,
 plot(t,y); grid;
 aks=axis;
 hold on
 plot([t(i1) t(i2)],[y(i1) y(i2)],'-+');
 plot([aks(1) aks(2)],[y(i1) y(i1)],'--')
 plot([aks(1) aks(2)],[y(i2) y(i2)],'--')
 plot([aks(1) aks(2)],[yf yf],'--')
 plot([aks(1) aks(2)],[ys ys],'--')
 
 y0=y(i3); t0=t(i3);
 plot(t0,y0,'+');
 t1=t0+Ts*(aks(3)-y0)/mdy;
 t2=t0+Ts*(aks(4)-y0)/mdy;
 plot([t1 t2],aks(3:4),'-');
 hold off
 title('Rise time and step response');
end
