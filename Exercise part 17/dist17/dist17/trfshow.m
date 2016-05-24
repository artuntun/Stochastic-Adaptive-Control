function trfshow(a,b,k);

bk=poldel(b,k);
na=length(a); nb=length(bk);
n=max(na,nb);

a=[a zeros(1,n-na)];
b=[bk zeros(1,n-nb)];

tf(b,a,1)
