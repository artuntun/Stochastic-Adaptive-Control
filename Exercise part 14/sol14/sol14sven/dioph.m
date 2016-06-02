function [x,y]=dioph(a,b,c,nx,ny,show)
%
% usage: function [x,y]=dioph(a,b,c,nx,ny)
%
% solve the polynomial equation:
%             
%             C = A*X + B*Y
%
% where the order of c is increased so the equation has a solution.
% Sylvester method.
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised 1999 

a=a(:); b=b(:); c=c(:); 
ma=length(a); mb=length(b); mc=length(c); 
na=ma-1; nb=mb-1; mx=nx+1; my=ny+1;
mT=mx+my;
% -------------------------------------------------------------------
Ta=zeros(mT,mx); 
Tb=zeros(mT,my);
for i=1:mx, Ta(i:i+na,i)=a; end;
for i=1:my, Tb(i:i+nb,i)=b; end;

Tab=[Ta Tb];
% -------------------------------------------------------------------
C=[c; zeros(mT-mc,1)];
% -------------------------------------------------------------------
if nargin > 5, % Graphics
 disp(' ')
 disp([ Tab C])
 disp(' ')
end
% -------------------------------------------------------------------
th = Tab\C;
x=th(1:mx); y=th(mx+1:mT);
x=x(:)'; y=y(:)';
