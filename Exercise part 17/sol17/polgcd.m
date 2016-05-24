function [g,r,s,p,q]=polgcd(a,b)
%usage: [g,r,s,p,q]=polgcd(a,b)
%
%Returns the greatest common divisor, g, from a and b.
%
%Determine g,r,s,p and q from:
%
%	ap + bq = g
%	ar + bs = 0
%
% Results:
%
% r=-b_0        s=A_0
% b=gb_0        a=ga_0
% l=ga_0b_0=ar=-bs
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
%

% Ref.: Kucera page 151
% Test: t34.m
% ----------------- Punkt 1 -------------------------------
small=1.0e-7;
n1=length(a); n2=length(b);
f1=a;  f2=b;
v11=1; v12=0;
v21=0; v22=1;
% ----------------- Punkt 2 -------------------------------
while ((abs(f1(n1))>small) & (abs(f2(n2))>small)),
% ----------------- ord(f1) > ord(f2) ---------------------
 if n1>n2,
  l=f1(n1)/f2(n2); n=n1-n2;
  f1=gcdsum(f1,f2,l,n); n1=length(f1);
  v11=gcdsum(v11,v12,l,n);
  v21=gcdsum(v21,v22,l,n);
% ----------------- ord(f1) < ord(f2) ---------------------
 else,
  l=f2(n2)/f1(n1); n=n2-n1;
  f2=gcdsum(f2,f1,l,n); n2=length(f2);
  v22=gcdsum(v22,v21,l,n);
  v12=gcdsum(v12,v11,l,n);
  end
% ---------------------------------------------------------
 end
% ----------------- Punkt 6 -------------------------------
if norm(f1)<small,
 g=f2; r=v11; s=v21; p=v12; q=v22;
else
 g=f1; r=v12; s=v22; p=v11; q=v21; 
end
% ---------------------------------------------------------
g=g(:)'; r=r(:)'; s=s(:)'; p=p(:)'; q=q(:)';
