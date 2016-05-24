function [q,r,s]=dsnlqg(a,b,k,c,rho)
%Usage: [q,r,s]=dsnlqg(a,b,k,c,rho)
%
% ru = qw-sy
%
% Design of a LQG controller

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark
% Revised 2000

a=a(:)'; b=b(:)'; c=c(:)';
b=poldel(b,k);
na=length(a)-1; nb=length(b)-1; nc=length(c)-1;

if rho<1, 
 m=spksum(spec(a)*rho,spec(b)); 
else,
 m=spksum(spec(a),spec(b)/rho); 
end;

p=sfak(m); np=length(p)-1;
p0=p(1); p=polclr(p/p0);
pc=conv(p,c);

%nr=nb-1; ns=max(na-1,np+nc-nb); % min with respect to x
%[r,s]=sylwest(a,b,pc,nr,ns);

%[r,s]=euclid(a,b,pc,'y');

ns=na-1; nr=max(nc+np-na,nb-1);
[r,s]=sylwest(a,b,pc,nr,ns);

r=polclr(r);
q=c*sum(p)/sum(b);

%r0=r(1);
%r=r/r0; s=s/r0; q=q/r0;
