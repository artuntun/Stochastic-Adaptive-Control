function [ma,mc]=spec(a,c)
%Usage ma=spec(a)
%      [ma,mc]=spec(a,c)
%
%Determine the spectrum of the polynomium a (and c), ie.
%
% Ma=A(z^{-1})A(z)
%
% Mc=C(z^{-1})C(z)

a=a(:)';
ma=conv(a,fliplr(a));
if nargin>1,
 c=c(:)';
 mc=conv(c,fliplr(c));
end
