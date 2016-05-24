function h=sysimp(a1,a2,a3,a4,a5)
%
% Determine \frac{b}{a}= [h]_{n}
%
% Usage: h=sysimp(a,b)
%        h=sysimp(a,b,n)
%        h=sysimp(A,B,C,D)
%        h=sysimp(A,B,C,D,n)
%
% See also polexp

if nargin<4,
 a=a1; b=a2; 
 if nargin==2, nstp=length(a); else nstp=a3; end;
 if length(a)<2,
  h=[b(:)/a(1); zeros(nstp+1-length(b),1)];
  return
  end
 [A,B,C,D]=trf2ss(a,b);
else % end trf input
 A=a1; B=a2; C=a3; D=a4;
 if nargin==4, nstp=max(size(A)); else nstp=a5; end;
end

if nstp<0, h=[]; return; end;

u=[1;zeros(nstp,1)];
x=ltitr(A,B,u);
h=x*C'+u*D;
%h=x*C+u*D;

%-----------------------------------------------------------------------
% if no output argument just plot it
if nargout==0,
 t=0:length(h)-1; t=t(:);
 plot(t,h); grid; title('Impulseresonse');
 clear h
 end
%-----------------------------------------------------------------------
