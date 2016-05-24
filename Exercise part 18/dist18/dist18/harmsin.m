function u=harmsin(n,z)

[ns,n2]=size(z);
if n2~=2,
 help harmsin
 return
end

u=zeros(n,1);
for i=1:ns,
 u=u+z(i,1)*sinwave(n,z(i,2));
 plot(u)
end
grid
axis([0 n -1.5 1.5])

