function [b]=polreduc(bb)
% usage: function b=polreduc(bb)
%
% polclr justerer ordenen af polynomiet bb og placerer
% resten (med justeret orden) i b
%
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 
 
small=1.0e-7;
m=length(bb);
% -------------- find the order of bb ----------
while ((m>1) & (abs(bb(m))<small)),
 m=m-1;
 end;
% ----------------------------------------------
if ( m>1 ),
 b=bb(1:m);
else
 b=bb(1);
 end;
end

