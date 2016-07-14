function [Q,R,S,G] = dsngmv(A,B,k,C,By,Ay,Bw,Aw,rho,Bu,Au)
%
% Usage: [Q,R,S,G] = dsngmv(A,B,k,C,By,Ay,Bw,Aw,rho,Bu,Au)
%        [Q,R,S,G] = dsngmv(A,B,k,C,By,Ay)
%        [Q,R,S,G] = dsngmv(A,B,k,C,By,Ay,Bw,Aw)
%
% work on y'=frac{1}{Ay}, u'=frac{1}{Au}, w'=frac{Bw}{Aw}
% ie on
%         Ru'=Qw'-Sy'
%
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
% revisited 1998, 2002

if nargin<4,
 disp('Wrong syntaks in dsngmv')
 return
end
A=A(:)'; B=B(:)'; C=C(:)';

if nargin<5 % MV_0
 rho=0;
 By=1; Bw=1; Bu=0;
 Ay=1; Aw=1; Au=1;
elseif nargin==8,
 rho=0;
 Bu=0;
 Au=1;
end

By=By(:)'; Bu=Bu(:)'; Bw=Bw(:)';
Ay=Ay(:)'; Au=Au(:)'; Aw=Aw(:)';

ByC=conv(By,C); nAy=length(Ay)-1;
AyA=conv(Ay,A); nBy=length(By)-1;
[G,S]=truncimp(AyA,k,ByC);
Q=C;
alf=rho/B(1);
R=polsum(conv(conv(Au,B),G),alf*conv(Bu,C));
R=R(:)';

%r0=R(1);
%R=R/r0; Q=Q/r0; S=S/r0;
