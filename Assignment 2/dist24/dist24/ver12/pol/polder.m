function b=polder(a)
%Return the derivative of a polynomial:
% a = c0 + c1 x + c2 x^2 + ...
% b: row vector

a=a(:);
n=max(size(a));
m=zeros(n-1,n);
for i=1:n-1,
 m(i,i+1)=i;
end
b=m*a;
b=b(:)';
end
