function b=z2pol(z,z2);
%Usage: b=z2pol(z,[z2]);
%
%Converts a sequence of zeroes into a polynomial
%ie. the opposite of roots. z contains simple roots and
%z2 contains complex roots. Each row contain real and imaginary
%part of root.

if nargin<2, z2=[]; end;

b=1;
n=length(z);
for i=1:n,
 b=conv(b,[1 -z(i)]);
end

n=size(z2,1);
for i=1:n,
 b=conv(b,[1 -2*z2(i,1) z2(i,1)^2+z2(i,2)^2]);
end
