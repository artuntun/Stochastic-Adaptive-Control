function [c,u]=pold2g(ai,h)
%Usage: [c,u]=pold2g(a,h)
%
% Convert a polynomial in the q-domain into a polynomial in the
% Delta-domain. Samplingperiod h. Result c. Transformmatrix u.
%

% testfile: t58.m tt.m

a=ai(:);
in=max(size(a)); n=in-1;
u=pascal(n)';
x=-h/2; hi=x;
for i=2:in,
  for r=1:in+1-i, 
   s=i+r-1;
   u(r,s)=u(r,s)*hi;
 end
 hi=hi*x;
end
c=u*a; c=c(:)';
end



