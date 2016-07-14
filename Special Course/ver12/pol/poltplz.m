function T=poltplz(a,n);
% Usage: T=poltplz(a,n)
%
% Forms a nonsquare toeplitz matrix of the elements in a. 
%
% If a square matrix is desired just T=T(1:n,1:n);

a=a(:); na=length(a)-1;
if nargin<2, n=na; end

T=zeros(na+n,n);
for i=1:n,
 T(i:i+na,i)=a;
 end
