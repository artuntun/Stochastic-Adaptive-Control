% Test af forward


load ../dist5/dat1
%plt
y=data(:,4); 
u=data(:,5); 
z=[y u];
Ze=dtrend(z);
%print date.pps
%disp('hit it'); pause

th=forward(Ze);
figure(1);
zpplot(th2zp(th,0),2.5758)
figure(2);
zpplot(th2zp(th,1),2.5758)

