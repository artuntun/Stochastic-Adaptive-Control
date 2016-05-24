function [ax,bx,kx]=trfclr(a,b)
%usage: [ax,bx,k]=trfclr(a,b)
%
% Find the resulting tranfer function bx/ax when b/a is given.
% Removes common factors and extract the time delay k.
% Finder resulterende overfringsfunktion med
% tidsforsinkelse k.
% 
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

% home: sys
% test: t3.m
% uses: polclr, polgcd

a=a(:)'; b=b(:)';
[bb,k]=polclr(b);
[aa,k0]=polclr(a);
kx=k-k0;
[g,bx,ax]=polgcd(aa,bb); 

%ax=poldiv(g,aa);
%bx=poldiv(g,bb);

ao=ax(1); ax=ax(:)'/ao; bx=-bx(:)'/ao;
