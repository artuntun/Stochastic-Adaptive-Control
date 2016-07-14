function [q,r,s,g] = dsngsp(a,bpos,bneg,k,c,am,bm1);
%usage: [q,r,s,g] = dsngsp(a,bpos,bneg,k,c,am,bm1);
%
% ru = qw-sy
%
% Design of a GSP controller.
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
%,
  
na=length(a)-1; nc=length(c)-1; nam=length(am)-1; nbneg=length(bneg)-1;

bk=poldel(bneg,k); amc=polmul(am,c); 

%[g,s]=euclid(a,bk,amc,'y');

%ns=max(na-1,nc+nam-k-nbneg); ng=k+nbneg-1;
%[g,s]=sylwest(a,bk,amc,ng,ns);

ns=na-1; ng=max(nc+nam-na,nbneg+k-1);
[g,s]=sylwest(a,bk,amc,ng,ns);
  
q=polmul(c,bm1);
r=polmul(bpos,g);
  
%r0=r(1);
%r=r/r0; s=s/r0; q=q/r0;
