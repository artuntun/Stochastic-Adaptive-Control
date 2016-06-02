function [l,s]=sslq(a,b,q1,q2,mode,mon)
%-------------------------------------------------------------------------
% usage: [l,s]=sslq(a,b,q1,q2{,mode,mon})
 
% Programmed by  Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

%-------------------------------------------------------------------------
if nargin==4,
 mon=0; 		% monitor: 0,1
 mode=1; 		% algorithmmode: 1,2
elseif nargin==5,
 mon=0;
end
%-------------------------------------------------------------------------

small=1-1e-4;
if max(abs(eig(a)))<small,
 s=syslyap(a',q1);
else
 s=q1;
end

switch mode
%-------------------------------------------------------------------------
case 1,
%-------------------------------------------------------------------------
% Mosca p. 34 - Klienman's algoritme
if mon==1, disp('sslq - Kleinmann algorithm'); end;
res=1e-6; tty=res+1;
l=a'*s*b*inv(b'*s*b+q2); l0=l;
while tty>res,
 if mon==1, disp(l'); end;
 ak=a-b*l';
 if max(abs(eig(ak)))<small,
  s=syslyap(ak',q1+l*q2*l');
 else
  s=ak'*s*ak+q1+l*q2*l';
 end;
 l=a'*s*b*inv(b'*s*b+q2);
 tty=norm(l-l0);
 l0=l;
 end
%-------------------------------------------------------------------------
case 2,
%-------------------------------------------------------------------------
if mon==1, disp('sslq - Basic algorithm'); end;
l=a'*s*b*inv(q2+b'*s*b); l0=l;
res=1e-6; tty=res+1;
while tty>res,
 if mon==1, disp([l' tty]);  end;
 ac=a-b*l';
 s=ac'*s*ac+l*q2*l'+q1;
 l=a'*s*b*inv(q2+b'*s*b);
 tty=norm(l-l0);
 l0=l;
 end
%-------------------------------------------------------------------------
otherwise,
 disp('mode out of range in sslq');
end

 
