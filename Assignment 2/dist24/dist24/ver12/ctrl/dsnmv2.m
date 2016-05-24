function [Q,R,S,Bw,Aw,G] = dsnmv2(A,B,k,C,Bm,Am,Be,Ae)
%
% Usage: [Q,R,S,Bw,Aw,G] = dsnmv2(A,B,k,C,Bm,Am,Be,Ae)
%
% works on w'=frac{Bw}{Aw}w where
%
% Bw/Aw = Ae*Bm/Be/Am
%
% ie on
%         Ru=Qw'-Sy
%
 
% Programmed 2002 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

Be=Be(:)'; Bm=Bm(:)';
Ae=Ae(:)'; Am=Am(:)';

By=Ae; Ay=Be;
ByC=conv(By,C); AyA=conv(Ay,A); 
[G,S]=truncimp(AyA,k,ByC);
Q=C;
R=conv(B,G);
R=R(:)';

%r0=R(1);
%R=R/r0; Q=Q/r0; S=S/r0;

if nargout>3,
 Aw=conv(Am,Be);
 Bw=conv(Bm,Ae);
end;

