function [x,y]=poldioph(a,b,c);

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

%ref Kucera side 43
%testfil: t28.m

[g,r,s,p,q]=polgcd(a,b);
%disp(g)
c0=poldiv(g,c);
x0=polmul(p,c0);
y0=polmul(q,c0);
b0=poldiv(g,b);
[u,v]=poldiv(b0,x0);
a0=poldiv(g,a);
x=v;

y1=polsum(y0,polmul(a0,u));
y=polclr(y1);

end

