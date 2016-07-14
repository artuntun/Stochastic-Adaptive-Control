function r=kvdr(p)

% Usage: r=kvdr(p)
% square root of p ie. p=r*r'

[u,s,v]=svd(p);
r=u*sqrt(s);
