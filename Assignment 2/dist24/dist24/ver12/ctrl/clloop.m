function [ap,bp,kp]=clloop(a,b,k,c,r,s,q,loop)
%Usage [ap,bp,kp]=clloop(a,b,k,c,r,s,q,loop)
% 
%Determine the transfer function ie. q^{-kp}\frac{bp}{ap} when a system
%
%  a*y = b*u(t-k) + c*e
%
% is controlled by:
%
% r*u=q*w-s*y
%
%loop
% 1   w -> y
% 2   e -> y
% 3   w -> u
% 4   e -> u
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

%uses: polsum, polmulm trfclr
 
a=a(:)'; b=b(:)'; c=c(:)';
r=r(:)'; s=s(:)'; q=q(:)';
bk=poldel(b,k);
ac=polsum(polmul(a,r),polmul(bk,s));
% from ref to output
if loop==1,
 bc=polmul(q,bk);
% from noise to output
elseif loop==2,
 bc=polmul(c,r);
% from ref to control
elseif loop==3,
 bc=polmul(q,a);
% from noise to control
elseif loop==4,
 bc=-polmul(c,s);
end

[ap,bp,kp]=trfclr(ac,bc);
