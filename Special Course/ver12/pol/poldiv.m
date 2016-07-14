function [u,v]=poldiv(a,b);
%usage: [u,v]=poldiv(a,b);
%
% Return the polynomial kvotient u= b/a, ie.
% 
%	b=au+v
%
%where deg(v) < deg(a). v is the rest from the division.
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% Ref.: Kucera p. 148. Notice reverse notation
% Test: t33.m

v=b; mb=length(b); ma=length(a); 
a1=a(1:ma-1);ah=a(ma);
u=[]; mv=mb;
while mv >=ma,
 lam=v(mv)/ah; n=mv-ma; 
 mv=mv-1;
 v=v(1:mv)-lam*[zeros(1,n) a1];
 u=[lam u];
 end
if isempty(u), u=0; end
if isempty(v), v=0; end
