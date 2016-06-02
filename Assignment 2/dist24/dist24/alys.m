function alys(A,B,k,C,s2,Q,R,S,G)

global data

t=data(:,1);
w=data(:,2);
y=data(:,3);
u=data(:,4);
res=data(:,5);
xi=data(:,6);
en=data(:,7)*sqrt(s2);

e=w-y;

et=cumsum(xi.^2);
xit=cumsum(xi.^2);
ut=cumsum(u.^2);
epst=cumsum(res.^2);
en=cumsum(en.^2);

clf;
plot(t,epst,'--',t,ut,':',t,et,'-',t,en,'-');
legend('Est. tab','styretab','Styrefejl','Min tab')
grid;
