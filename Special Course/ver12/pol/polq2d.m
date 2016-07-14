function [c,l]=polq2d(ai,h)
%Usage: [c,l]=polq2d(a,h)
%
% Convert a polynomial in the q-domain into a polynomial in the
% Delta-domain. Samplingperiod h. Result c. Transformmatrix l.
%

% testfile: t58.m

a=ai(:);
in=max(size(a)); n=in-1;
l=fliplr(fliplr(pascal(n))');
hh=zeros(in,in);  hi=1;
for i=0:n,
 hh(in-i,in-i)=hi;
 hi=hi*h;
end
l=hh*l;
c=l*a; c=c(:)';
end



