function y=rrampf(ns,p);
% Usage: y=rrampf(ns,p);

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

if nargin<2,
 p=0.1;
 if nargin<1,
  ns=100;
  end
 end

u=randch(ns,p);
y=cumsum(cumsum(u));
