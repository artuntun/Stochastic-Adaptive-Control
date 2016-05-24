function nrm=trfnorm(a,b);
%Usage: norm=trfnorm(a,b);
%
%Determine the 2 norm of a transfer function (the variance of the output
%if input is N_{iid}(0,1).


% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

%--------------------------------------------------------------------------
% Ref.: Kucera p. 154
%       Aastroem p. 125
%--------------------------------------------------------------------------
mon=0; % Monitor (1)
%--------------------------------------------------------------------------

a=a(:)'; b=b(:)';
na=length(a); nb=length(b); n=max(na,nb);
a=[a zeros(1,n-na)];
b=[b zeros(1,n-nb)];
if mon==1,
 disp(a)
 disp(b)
 end

a0=a(1);
beta=[]; gam=[];
while n>1,
 lam=a(n)/a(1);
 my=b(n)/a(1);
 beta=[beta; b(n)]; gam=[gam; my];
 ar=fliplr(a); n=n-1; ar=ar(1:n);
 a=a(1:n)-lam*ar;
 b=b(1:n)-my*ar;
 if mon==1,
  disp(a)
  disp(b)
  end
 end
beta=[beta; b(1)]; gam=[gam; b(1)/a(1)];
nrm=beta'*gam/a0;
