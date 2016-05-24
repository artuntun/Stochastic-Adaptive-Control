function [x,y,r,s]=euclid(a,b,c,reduc,mon);
%Usage: [x,y,r,s]=euclid(a,b,c); 		% minimum degree (wrt. x)
%       [x,y,r,s]=euclid(a,b,c,'x');		% minimum degree (wrt. x)
%       [x,y,r,s]=euclid(a,b,c,'y');		% minimum degree (wrt. y)
%       [x,y,r,s]=euclid(a,b,c,'z');		% no reduction
%
%Solves the diophantine equation
%
% AX+BY=C
%
%using the euclidian algorithm.

%home: pol
%ref: Kucera side 43
%testfil: t28.m

%-----------------------------------------------------------------------------
%mon=1; Monitor (0,1)
%-----------------------------------------------------------------------------

if nargin==3,
 reduc='x';
 mon=0;
elseif nargin==4,
 mon=0;
end
 
[g,r,s,p,q]=polgcd(a,b);
c0=poldiv(g,c);
x=conv(p,c0);
y=conv(q,c0);
if mon==1,
 disp('-------------- Euclid ----------------');
 disp('If A and B are coprime then the');
 g
 disp('general solution can be given as:')
 disp(' X=PC+RF')
 disp(' Y=QC+SF')
 disp('where:')
 p
 q
 ctmp=c;c=c0;
 c
 c=ctmp;
 r
 s
 disp('--------------------------------------');
 end

if reduc=='x',
 [u,x]=poldiv(-r,x);
 y=polclr(polsum(y,conv(s,u)));
elseif reduc=='y',
 [u,y]=poldiv(s,y);
 x=polclr(polsum(x,conv(-r,u)));
end
