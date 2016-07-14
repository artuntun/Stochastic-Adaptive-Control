function y=rstepf(ns,p),;
%usage: y=rstepf(ns,p);
 
% Programmed 2000 by Niels K. Poulsen 
% Dept. of Mathematical Modelling, 
% Technical University of Denmark 

if nargin<2,
 p=0.1;
 if nargin<1,
  ns=100;
  end
 end

u=randch(ns,p);
y=cumsum(u);
