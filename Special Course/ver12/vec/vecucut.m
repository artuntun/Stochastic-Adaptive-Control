function [u,y]=vecucut(v,n);
% Usage: [u,y]=vecucut(v,n);
%
%  v = [ u y ]
%The first n elements of a vector v are placed in
%the vector u. The rests are placed in y.
m=max(size(v));
u=v(1:n);
y=v(n+1:m);
