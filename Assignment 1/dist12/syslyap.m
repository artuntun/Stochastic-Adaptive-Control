function p=syslyap(a1,r1)
% function p=syslyap(a,r1)
%
% Solves P=A*P*A'+R1 for P
%
 
% Programmed 2002 by Niels K. Poulsen 
% Informatics and Mathematical Modelling, 
% Technical University of Denmark 

% Torsten Soederstroem s. 107 

mon=0; % Monitor
p0=r1; a=a1; res=1e-3; tt1=res+1;
while tt1>res,
 p=a*p0*a'+p0;
 a=a*a;
 tt1=norm(p-p0);
 p0=p;
 if mon==1, disp(p); disp('--------------------------'); end;
 end

 
