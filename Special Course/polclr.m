function [b,k]=polclr(bb,forward)
% usage: function [b,k]=polclr(b,[forward])
%
% polclr traekker tidsforsinkelsen k ud af et polynomium.
% resten (med justeret orden) laegges i b
%
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
%. 

small=1.0e-7;
if nargin<2,
 forward=0;
end;

m=length(bb);
% --------------- Check for zero polynomials ----
if norm(bb)<m*small,
 k=0;
 b=0;
 return
 end

if forward==0,
 % -------------- find the order of bb ----------
 while (abs(bb(m))<small),
  m=m-1;
  end;
 % ----------------------------------------------
 if nargout>1,
 % -------------- find the timedelay ------------
  n=0;
  while (abs(bb(n+1))<small),
    n=n+1;
    end
  k=n;
  b=bb(1+k:m);
 else
  b=bb(1:m);
 end
 % ----------------------------------------------
else % Forward notation
 m=1;
 while (abs(bb(m))<small),
  m=m+1;
 end
 b=bb(m:end);
end
