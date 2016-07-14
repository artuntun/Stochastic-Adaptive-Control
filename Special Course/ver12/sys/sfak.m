function c=sfak(m,p);
%Usage: c=sfak(m)
%
%   or:
%
%       c=sfak(m,p)
%
%Solves the spectrakfactorization problem:
%
%   C(z)C(z^{-1})=M(z)
%
%where:
%
%   C(z^{-1})=c_0+c_1z^{-1}+ ... + c_nz^{-n}
%
%   M(z)=r_nz^{n}+ ... + r_0 + ... + r_nz^{-n}
%
%Inputs:
%
% m: [r_n ... r_1 r_0 r_1 ... r_n]'
% p: Initial guess on C. Optional
%
%Output:
%
% c: [c_0 c_1 ... c_n]'
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

%test file: t42.m

tol=1.0e-5;dp=tol+1;

%----------------------------------------------------------------------
% Check for symmetric spektrum
m=m(:)';
err=m-fliplr(m);
small=1e-6;
if max(abs(err))<small, 
 n=(length(m)+1)/2; % n=order+1
 m=m(n:end);
else
 n=length(m);
end;
%----------------------------------------------------------------------

m2=2*m(:); 
if nargin<2, p=m/m(1); end;
p=p(:)';

p0=p;
while dp>tol,
 %disp(abs(roots(p))')
 hank=zeros(n,n); topl=hank;
 pl=p; pr=p;
 hank(1,:)=pl; topl(1,:)=pr;
 for i=1:n,
  hank(i,:)=pl; topl(i,:)=pr;
  pl(1:n-1)=pl(2:n); pl(n)=0;
  pr(2:n)=pr(1:n-1); pr(1)=0;
  end
 x=(hank+topl)\m2; x=x(:)';
 p=0.5*(p+x);
 dp=norm(p-p0,'fro');
 p0=p;
 end
c=p;
