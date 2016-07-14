function v = trfvar2(aa,bb)
%Usage v = trfvar2(a,b)
%
%Determines the variance of the output of an ARMA model
%
% A(q^{-1})y_t = C(q^{-1})e_t
%
%when the input variance is 1.
%
% If A is unstable, then v < 0 !!
%
% The Aastroem version
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

na=max(size(aa)); nb=max(size(bb));
if na>nb,
 a=aa(:)';
 b=[bb(:)' zeros(1,na-nb)];
else
 a=[aa(:)' zeros(1,nb-na)];
 b=bb(:)';
end
if a(1)<0,
 a=-a;
end;
a0=a(1);
 v=0;
 n=max(size(a))-1;
 for k=1:n,
  l=n+1-k;
  l1=l+1;
  alfa=a(l1)/a(1);
  beta=b(l1)/a(1);
  v=v+beta*b(l1);
  for i=1:l,
   m=l+2-i;
   as(i)=a(i)-alfa*a(m);
   b(i)=b(i)-beta*a(m);
   end
% if as(1)<0 then ustabil !  
  a=as;
  end
 v=v+b(1)^2/a(1);
 v=v/a0;
