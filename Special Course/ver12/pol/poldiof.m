function [x,y]=poldiof(a,b,c);

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

%ref Kucera side 43
%testfil: t28.m

[g,r,s,p,q]=polgcd(a,b);
%disp(g)
x0=polmul(p,c);
y0=polmul(q,c);
[u,v]=poldiv(b,x0);
x=v;

y1=polsum(y0,polmul(a,u));
y=polclr(y1);
