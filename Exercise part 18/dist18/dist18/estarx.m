function [th,p,res,cndno]=estarx(yu,nn)
% ESTARX computes the LS,ML estimate of the parameters in a AR model
%    
%                   A*y = B*u(t-k) + e
%
% [th,p,res,cndno]=estarx(yu,nn)
% 
% yu:		contain output and input variable = [y u]
% nn:		orders of polynomials = [na nb k]
%
% th:		estimate
% p:		variance matrix
% res:		residual sequence
% cndno:	conditional number of fi'*fi
%
 
%    Niels K. Poulsen 
%    Institute of Mathematical Modelling, 
%    Technical University of Denmark 
 

%   y(t1)   = -a(1)*y(na) -  ... - a(na)*y(1)    
%             + b(0)*u(t1-k) + ... + b(nb)*u(t1-k-nb)
%    .      .    .   .               .   .
%   y(t)    = -a(1)*y(t-1) - ... - a(na)*y(t-na) 
%             + b(0)*u(t-k) + ... + b(nb)*u(t-k-nb)
%    .      .    .   .               .   .
%   y(n)    = -a(1)*y(n-1) - ... - a(na)*y(n-na) 
%             + b(0)*u(n-k) + ... + b(nb)*u(n-k-nb)
%
% or
%
%   z = fi*th + res
%
 y=yu(:,1);
 u=yu(:,2);
 na=nn(1);
 nb=nn(2);
 k=nn(3);
%
 [n,m]=size(y);
 t1=max([na nb+k])+1;
 fi=zeros(n+1-t1,na+nb+1);
 for i=1:na,
  fi(:,i)=-y(t1-i:n-i);
  end
 for i=na+1:na+nb+1,
  fi(:,i)=u(t1-k+na+1-i:n-k+na+1-i);
  end
 z=y(t1:n);
 xx=fi'*fi;
 cndno=cond(xx);
 xy=fi'*z;
 th=xx\xy;
 res=z-fi*th;
 sak=res'*res;
 var=sak/(n-na);
 p=(xx\eye(xx))*var;
 end;

