function [b,k]=polclr(bb,forward)
% usage: function [b,k]=polclr(b,[forward])
%
% The procedure clears trailing zeroes.
% If NARGIN==2 the procedure extracts the 
% time delay k from b and ajusts the order of the rest. 
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% Revised 1998. 

tol=1.0e-7;
if nargin<2,
 forward=0;
end;

m=length(bb);
% --------------- Check for zero polynomials ----
if norm(bb)<m*tol,
 k=0;
 b=0;
 return
 end

if forward==0,
 % -------------- find the order of bb ----------
 while (abs(bb(m))<tol),
  m=m-1;
  end;
 % ----------------------------------------------
 if nargout>1,
 % -------------- find the timedelay ------------
  n=0;
  while (abs(bb(n+1))<tol),
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
 while (abs(bb(m))<tol),
  m=m+1;
 end
 b=bb(m:end);
end
