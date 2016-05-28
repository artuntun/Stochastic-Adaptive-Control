load dat1
plt
y=data(:,4); 
u=data(:,5); 
z=[y u];
Ze=dtrend(z);
print date.pps
disp('hit it'); pause

load dat2
plt
y=data(:,4); 
u=data(:,5); 
z=[y u];
Zt=dtrend(z);
print datt.pps
disp('hit it'); pause

clf;
[ns,le,lt]=sfind(3,Ze,Zt,2);
