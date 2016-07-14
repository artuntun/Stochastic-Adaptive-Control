function estpres(th,p);
%usage: estpres(th,p)
%       estpres(th_in_thetaformat)
%       
%
% presenting the estimate and the 99% cinf.
%
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

if nargin==1,
 [th,p]=th2par(th);
end;
 
n=max(size(th));
fraq=2.5758;
disp(' ')
disp('estimate 99% cinf')
disp(' ')
dd=zeros(n,4);
for i=1:n,
 ll=th(i) - fraq*sqrt(p(i,i));
 ul=th(i) + fraq*sqrt(p(i,i));
 varia=fraq*sqrt(p(i,i));
 dd(i,1)=th(i);
 dd(i,2)=varia;
 dd(i,3)=ll;
 dd(i,4)=ul;
 end
disp('   estimat      +/-       ll       ul')
disp(dd)
