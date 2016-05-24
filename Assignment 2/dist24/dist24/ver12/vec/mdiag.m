function a=mdiag(a1,a2,a3)
% Produce a block diagonal matrix, a, whose block matrices are
% a1, a2, a3.
%
% Usage: a=mdiag(a1,a2,a3)
%
n1=max(size(a1)); n2=max(size(a2));
n=n1+n2; a=zeros(n,n);
a(1:n1,1:n1)=a1; 
a(n1+1:n,n1+1:n)=a2;
if nargin>2,
 n3=max(size(a3));
 ny=n+n3; aa=zeros(ny,ny); aa(1:n,1:n)=a; 
 aa(n+1:ny,n+1:ny)=a3; n=ny; a=aa;
 end
end
