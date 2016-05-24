function y=rampf(ts,tz);
% Usage: y=rampf(ts,tz);

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

if nargin<2,
 tz=0;
 if nargin<1,
  ts=100;
  end
 end
  
tr=1:ts;
tr=tr(:);
y=max(tr-tz,0);
