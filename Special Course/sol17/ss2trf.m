function [ap,bp]=ss2trf(al,bl,cl,dl,iy,iu)
%SS2TRF	State-space to transfer function conversion.
%	[DEN,NUM] = SS2TRF(A,B,C,D,iy,iu)  calculates the transfer function:
%
%			NUM(s)          -1
%		H(s) = -------- = C(sI-A) B + D
%			DEN(s)
%	of the system:
%		.
%		x = Ax + Bu
%		y = Cx + Du
%
%	from the iu'th input to the iy output.  
%       Vector DEN contains the coefficients of the
%	denominator in descending powers of s.  The numerator coefficients
%	are returned in matrix NUM with as many rows as there are outputs y.
%
% NB local version
%disp('--------------------- ss2trf ------------------------------')
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
 
n=max(size(al));
if n<1,
 ap=1; bp=dl;
else 

 % ref.: Kailath p. 657
 if nargin==4,
  iu=1; iy=1;
  end
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
%disp('--------------------- ss2trf ------------------------------')
