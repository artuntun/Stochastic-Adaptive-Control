function pltth(th0)
global datath 

clf;
t=datath(:,1);
th=datath(:,2:end);

ti=[min(t) max(t)];
th0i=[th0 th0];

plot(t,th,ti,th0i,'--'); 
grid; ylabel('\theta'); xlabel('t in sec');
ax=axis; axis([min(t) max(t) -2 2]);
legend('\theta',0);

