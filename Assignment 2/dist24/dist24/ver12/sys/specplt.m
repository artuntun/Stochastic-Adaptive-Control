function [amp,w]=specplt(acos,bcos,w)
%Usage: amp=specplt(acos,bcos,w)
%       [amp,w]=specplt(acos,bcos)
%       specplt(acos,bcos)
%       specplt(acos,bcos,w)

ngi=nargin; ngo=nargout;
if ngi<3,
 dens=0.1;
 w=0:dens:pi;
 w=[-fliplr(w(2:end)) w];
end;

den=acos*mcos(w,length(acos)-1);
num=bcos*mcos(w,length(bcos)-1);
amp=num./den;

if ngo==0,
 plot(w,amp); grid;
 aks=axis; axis([-pi pi aks(3:4)]);
 clear amp
end

function mc=mcos(w,n)
% mc=
% [      1        1      ...
%     cos(w1)   cos(w2)  ...
%    cos(2*w1) cos(2*w2) ...
%        .        .      ...
%    cos(n*w1) cos(n*w2) ...
m=length(w);
mc=ones(1,m);
for i=1:n,
 mc=[mc;cos(i*w)];
end

