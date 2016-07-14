function trfshow(a,b,k);

b=poldel(b,k);
na=length(a); nb=length(b);
n=max(na,nb);

a=[a zeros(1,n-na)];
b=[b zeros(1,n-nb)];

tf(b,a,1)
