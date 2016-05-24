function p=syslyap(a1,r1,mth,mon)
% Usage: P=syslyap(A,R1)
%        P=syslyap(A,R1,method,monitor)
%
% Solves P = A*P*A' + R1 for P
%
 
% Programmed 2002 by Niels K. Poulsen 
% Informatics and Mathematical Modelling, 
% Technical University of Denmark 

% testfile: t5.m
% home: sys

ng=nargin;
if ng<4, mon=0; end; % Monitor
if ng<3, mth=1; end; % Method
if isempty(mth), mth=1; end;
%-----------------------------------------------------------------------
% Torsten Soederstroem s. 107 
if mth==1,
 p0=r1; a=a1; res=1e-3; tjek=res+1;
 while tjek>res,
  p=a*p0*a'+p0;
  a=a*a;
  tjek=norm(p-p0);
  p0=p;
  if mon==1, disp(p); fprintf('\n'); end;
  end
%-----------------------------------------------------------------------
% Head on iterations
elseif mth==2,
 p0=r1; p=p0; a=a1; res=1e-3; tjek=res+1;
 while tjek>res,
  p=a*p*a'+r1;
  tjek=norm(p-p0);
  p0=p;
  if mon==1, disp(p); fprintf('\n'); end;
 end
end
%-----------------------------------------------------------------------
 
