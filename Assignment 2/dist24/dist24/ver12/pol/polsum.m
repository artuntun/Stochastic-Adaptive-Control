function c=polsum(a,b,forward)
% Add two polynomials disrespect their degree
%
%Usage c=polsum(a,b[,forward])
%
 
% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised 1998

if nargin<3,
 forward=0;
end

na=length(a); nb=length(b); n=max(na,nb);
if forward==1,
 a=[zeros(1,n-na) a(:)' ]; b=[ zeros(1,n-nb) b(:)' ];
else, 
 a=[a(:)' zeros(1,n-na)]; b=[b(:)' zeros(1,n-nb)];
end
c=a+b;
