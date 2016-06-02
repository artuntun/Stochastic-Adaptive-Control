function [a1,b1,c1,d1]=syscan(ai,bi,nr)
%Constructs canonical forms from transfer functions.
%
% Usage: [a,b,c,d]=syscan(ap,bp,type)
%
% ap: num. polynomial
% bp: den. polynomial
% type: type of canonical form (Optional)
% a,b,c,d: matrices in state space decription
%
% Type:
% 1: C-form
% 2: O-form (default)
% 3: Co-form
% 4: Ob-form
% 5: Direct form
 
% Programmed by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 

%----------------------------------------------------------------------------
mon=0; % (0,1)
%----------------------------------------------------------------------------

if nargin<3, nr=2; end

a=ai(:)'; b=bi(:)';
a0=a(1); a=a/a0; b=b/a0; b0=b(1);
ma=length(a); mb=length(b);
m=max(ma,mb); n=m-1;
an=[a zeros(1,m-ma)];
bn=[b zeros(1,m-mb)];
ener=[1 zeros(1,n-1)]';
d1=b0; 
   
if n==0,
 a1=[]; b1=[]; c1=[]; 
elseif n==1,
 a1=-an(2); b1=bn(2)-bn(1)*an(2); c1=1; 
else
 % disp('egentlig kanonisk form')
 if nr==1,
  % disp('Controller canonical form - type 1')
  a1=[-an(2:n+1); eye(n-1) zeros(n-1,1)];
  b1=ener;
  c1=bn(2:n+1)-b0*an(2:n+1); c1=c1';
 else,
  % if (nr==2), disp('Observer canonical form - type 2'); end
  a1=[-an(2:n)' eye(n-1); -an(n+1) zeros(1,n-1)];
  b1=bn(2:n+1)-b0*an(2:n+1); b1=b1(:);
  c1=ener';
  if nr>2,
   % Impulse respons needed for type 3 and 4
   a1=[-an(2:n+1); eye(n-1) zeros(n-1,1)];  b1=[1 zeros(1,n-1)]';
   c1=bn(2:n+1)-b0*an(2:n+1); c1=c1';
   u=[1 zeros(1,n)]'; x0=zeros(n,1);
   x=ltitr(a1,b1,u,x0);  h=x*c1.'+u*d1.';
   ain=fliplr(an);
   if nr==3,
    % disp('Controlability canonical form - type 3')
    a1=[zeros(1,n-1) -ain(1); eye(n-1) -ain(2:n)'];
    b1=ener; c1=h(2:n+1)'; 
   elseif nr==4,
    % disp('Observability canonical form - type 4')
    a1=[zeros(n-1,1) eye(n-1); -ain(1:n)];
    b1=h(2:n+1);
    c1=ener';
   elseif nr==5,
    % disp('Direct form');
    [a1,b1,c1,d1]=sysdr(an,bn);
   else
    disp('Type unknown');
    a1=[]; b1=[]; c1=[]; d1=[];
   end % nr=3,4
  end  % nr>2
 end   % nr=1 or
end    % n > 1

if mon
 switch nr
 case 1, disp('Controller canonical form - type 1')
 case 2, disp('Observer canonical form - type 2');
 case 3, disp('Controlability canonical form - type 3')
 case 4, disp('Observability canonical form - type 4')
 case 5, disp('Direct form');
 end
end
