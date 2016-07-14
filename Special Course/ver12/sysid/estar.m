function [th,p,res,cndno]=estar(y,na)
% AR computes the LS estimate of the parameters in a AR model
%    
%                   A*y = e
%
% [th,p,res,cndno]=estar(y,na)
% 
% y contain output variable
% na is the order of the A polynomial
%
% th estimate
% p  variance matrix
% eps residual sequence
% cndno conditional number of fi'*fi
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

%   y(na+1) = -a(1)*y(na) -  ... - a(na)*y(1)
%    .      .    .   .               .   .
%   y(t)    = -a(1)*y(t-1) - ... - a(na)*y(t-na) 
%    .      .    .   .               .   .
%   y(n)    = -a(1)*y(n-1) - ... - a(na)*y(n-na)
%
% or
%
%   z = fi*th + res
% 
 [n,m]=size(y);
 fi=zeros(n-na,na);
 for i=1:na,
  fi(:,i)=-y(na+1-i:n-i);
  end
 z=y(na+1:n);
 xx=fi'*fi;
 cndno=cond(xx);
 xy=fi'*z;
 th=xx\xy;
 if nargout>1,
  res=z-fi*th;
  sak=res'*res;
  var=sak/(n-na);
  p=(xx\eye(xx))*var;
 end;

