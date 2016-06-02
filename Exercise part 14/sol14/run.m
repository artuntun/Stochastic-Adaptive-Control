a=[1 0.7];
b=[1 0.5];
k=1;
c=1;

na=length(a)-1
nc=length(c)-1
bk=poldel(b,k)
[x,y]=dioph(a,bk,c,k-1,max(na-1,nc-k),1)
