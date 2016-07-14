function v = trfvar(a,b)
%Usage v = trfvar(A,C)
%
%Determines the variance of the output of an ARMA model
%
% A(q^{-1})y_t = C(q^{-1})e_t
%
%when the input variance is 1.
%
% If A is unstable, then v < 0 !!
 
% Programmed 2002 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

na=length(a); nb=length(b); n=max(na,nb);
if na>nb,
 b=[b(:)' zeros(1,na-nb)];
else
 a=[a(:)' zeros(1,nb-na)];
end

a0=a(1); a=a/a0; b=b/a0;
v=0;
for i=1:n,
 alf=a(end)/a(1);
 beta=b(end)/a(1);
 v=v+beta*b(end);
 ast=fliplr(a);
 if i<n,
  a=a(1:end-1)-ast(1:end-1)*alf; 
  b=b(1:end-1)-ast(1:end-1)*beta;
 end;
end
