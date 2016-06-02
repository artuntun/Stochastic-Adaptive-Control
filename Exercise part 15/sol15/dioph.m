function [x,y]=dioph(a,b,c,nx,ny,show)
%
% usage: function [x,y]=dioph(a,b,c,nx,ny)
%
% solve the polynomial equation:
%             
%             c = a*x + b*y
%
% where nx and ny are the orders of x and y. c will eventually be
% padded with zeros to obtain a solution.
% 
% Sylvester version.
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

a=a(:); b=b(:); c=c(:); 
nc=max(size(c));
na=max(size(a));
nb=max(size(b));
ncc=nx+ny+2;
% -------------------------------------------------------------------
ss=zeros(ncc,ncc);
for i=1:nx+1,
 for j=1:na,
  ss(j+i-1,i)=a(j);
  end;
 end;
for i=1:ny+1,
 for j=1:nb,
  ss(j+i-1,i+nx+1)=b(j);
  end;
 end;
% -------------------------------------------------------------------
vs=zeros(ncc,1);
for i=1:nc,
 vs(i)=c(i);
 end
% -------------------------------------------------------------------
if nargin > 5, % Show mode
 [nh1,nh2]=size(ss);
 sst=zeros(nh1,nh2+1);
 sst(:,1:nh2)=ss;
 sst(:,nh2+1)=vs;
 disp(' ')
 disp(sst)
end
% -------------------------------------------------------------------
th = ss\vs;
x=th(1:nx+1);
y=th(nx+2:ncc);
x=x(:)'; y=y(:)';
