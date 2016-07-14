function p=polgen(n,a);
%
% p=(s+a)^{n}
%

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

p=zeros(1,n+1);
for i=0:n,
 p(i+1)=comp(n,i)*a^i;
end

function y=comp(m,k)
% usage: function y=comp(m,k)
% 
% Determine the number of combinations
%
% ( m )
% ( k )
kk=fix(k); mm=fix(m);
y=fix(fak(mm)/(fak(mm-kk)*fak(kk)));

function y=fak(n)
% Determine n!
 
nn=fix(n);
y=1;
if nn>0,
 for i=1:nn,
  y=y*i;
 end;
end
y=fix(y);
