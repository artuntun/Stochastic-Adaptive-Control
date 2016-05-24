function wt=sgnstp(n,v,p)

%

% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% 
 
wt=zeros(n,1);
spr=sqrt(v);
w=randn;
for i=1:n,
 e=rand;
 if e<1-p,
  w=w;
 else
  dw=spr*randn;
  w=w+dw;
 end
 wt(i)=w;
 end
end
