function [x,y]=sylwest(a,b,c,nx,ny)
%
% usage: [x,y]=sylwest(a,b,c)
% or     [x,y]=sylwest(a,b,c,nx,ny)
%
% solves the Diaphantine equation:
%             
%             AX+BY=C
%
% This implementation uses the sylvester method
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
%----------------------------------------------------------------------------
mon=0; % Monitor (0,1,2)
%----------------------------------------------------------------------------

if nargin==3,
 A=polclr(a); A=A(:); na=length(A)-1;
 B=polclr(b); B=B(:); nb=length(B)-1;
 C=polclr(c); C=C(:); mc=length(C);
 mx=nb; 		% nx=nb-1
 my=max(na,mc-nb);	% ny=max(na-1, nc-nb);
elseif nargin==5,
 mx=nx+1;
 my=ny+1;
 A=a(:); B=b(:); C=c(:);
 na=length(A)-1; nb=length(B)-1; mc=length(C);
end

Ta=zeros(na+mx,mx);
if mx>0,
 for i=1:mx,
  Ta(i:i+na,i)=A;
  end
end
Tb=zeros(nb+my,my);
if my>0,
 for i=1:my,
  Tb(i:i+nb,i)=B;
  end
 end

n=max([na+mx nb+my mc]);
Ta=[Ta; zeros(n-na-mx,mx)];
Tb=[Tb; zeros(n-nb-my,my)];
C=[C;zeros(n-mc,1)];

SS=[Ta Tb];
if mon==1,
 disp([SS C]);
elseif mon==2,
 disp([size(SS) size(C)])
 end
th=inv(SS)*C;
x=th(1:mx);
y=th(mx+1:end);
x=x(:)'; y=y(:)';

if isempty(x), x=0; end
if isempty(y), y=0; end
