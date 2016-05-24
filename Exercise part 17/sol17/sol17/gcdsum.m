function z=gcdsum(a,b,fak,n)
%usage: z=gcdsum(a,b,fak,n)
%
% is used as a subroutine called by polgcd and poldiv.
%
% z   <-   a-fak*(del)^n*b
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% Test: t30.m
%---------------------------------------------------------- 
small=1e-9;
na=length(a); nb=length(b); nbb=n+nb;
%---------------------------------------------------------- 
% nz=max(na,n+nb);
% z=[a zeros(1,nz-na)]-[zeros(1,n) b*fak zeros(1, nz-nb-n)];
%---------------------------------------------------------- 
if na<nbb,
 %disp('case 1')
 z=[a zeros(1,nbb-na)]-[zeros(1,n) fak*b]; nz=nbb;
elseif nbb==na
 %disp('case 2')
 z=a-[zeros(1,n) fak*b]; nz=na;
else
 %disp('case 3')
 z=a-[zeros(1,n) fak*b zeros(1,na-nbb)]; nz=na;
end 
%---------------------------------------------------------- 
while (nz>1)&(abs(z(nz))<small), nz=nz-1; end
z=z(1:nz);
%---------------------------------------------------------- 
