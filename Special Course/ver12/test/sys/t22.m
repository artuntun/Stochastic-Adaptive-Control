disp('Test af acfar (ACF for AR-process)')

a=[1 0.4 0.3];
%a=[1 0.5];
v=1;

n=7;

u=[1;zeros(20,1)];
h=filter(1,a,u);
r=conv(h,flipud(h));
m=length(r); r=r((m+1)/2:end);
r=r(1:n+1)';

[ry,rye,t]=acfar(a,v,n);

disp([r' ry' rye'])
