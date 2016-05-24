function y=randg(n1,n2);
if nargin<1,
 n1=1;
 n2=1;
 end;
if nargin <2,
 n2=1;
 end
y=randn(n1,n2);
end
