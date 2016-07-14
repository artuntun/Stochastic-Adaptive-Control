function [as,bs,cs,ds]=armax2ss(a,b,k,c);

% Usage: [as,bs,cs,ds]=armax2ss(a,b,k,c)
%
%       -k                                
% Ay = q  Bu + Ce                               
%
% ns = [n1 nu ne]
%
 
% Programmed 1998 by Niels K. Poulsen 
% Institute of Mathematical Modelling, 
% Technical University of Denmark 

% testfile: .m
 
if nargin <4,
 disp(' ')
 disp('fejl !!')
 disp(' ')
 help armax2ss
 return
 end

a0=a(1);
a=a/a0; b=b/a0; c=c/a0;
a=a(:)'; b=b(:)'; c=c(:)'; 
bk=[zeros(1,k) b];
ma=length(a); mb=length(bk); mc=length(c);

m=max([ma mb mc]);
a=[a zeros(1,m-ma)];
bk=[bk zeros(1,m-mb)];
c=[c zeros(1,m-mc)];

[as1,bs1,cs1,ds1]=trf2ss(a,bk);
[as2,bs2,cs2,ds2]=trf2ss(a,c);
as=as1;
cs=cs1; 
bs=[bs1 bs2]; 
ds=[ds1 ds2];
