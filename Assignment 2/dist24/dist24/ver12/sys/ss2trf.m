function [ap,bp]=ss2trf(al,bl,cl,dl,iy,iu)
%ss2trf: State-space to transfer function conversion.
%
%			bp(s)           -1
%		H(s) = -------- = C(sI-A) B + D
%			ap(s)
%	of the system:
%		.
%		x = Ax + Bu
%		y = Cx + Du
%
%Usage: [...]=ss2trf(A,B,C,D)
%       [...]=ss2trf(A,B,C)
%       [...]=ss2trf(A,B,C,D,iy,iu)
%       [...]=ss2trf(sssys)
%
%       [ap,bp]=ss2trf(...)
%       tfsys=ss2trf(...)

% Testfile: t1.m
% home: sys

%disp('--------------------- ss2trf ------------------------------')
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

if nargin==1,
 [al,bl,cl,dl]=ssdata(al);
 iu=1; iy=1;
elseif nargin==3,
 dl=0; iu=1; iy=1;
elseif nargin==4,
 iu=1; iy=1;
end;
 
n=length(al);
if n<1,
 ap=1; bp=dl;
else 
 % ref.: Kailath p. 657
 b=bl(:,iu); c=cl(iy,:); a=al; d=dl(iy,iu);
 ap=zeros(1,n+1); bp=zeros(1,n+1);
 ap(1)=1;
 bp(1)=0;

 I=eye(n);
 s=I;
 ap(2)=-trace(a);
 bp(2)=c*b;
 if n>1,
  for j=2:n,
   s=s*a+ap(j)*I;
   bp(j+1)=c*s*b;
   ap(j+1)=-trace(s*a)/j;
  end
 end
 bp=bp+d*ap;
end

if nargout==1,
 ap=tf(bp,ap);
end;

%disp('--------------------- ss2trf ------------------------------')
