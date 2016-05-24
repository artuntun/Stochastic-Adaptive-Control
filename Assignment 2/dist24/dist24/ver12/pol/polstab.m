function stab=polstab(a);

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

%--------------------------------------------------------------------------
% Ref.: Kucera p. 153
%--------------------------------------------------------------------------
mon=1;
%--------------------------------------------------------------------------

if mon==1, disp(a); end

n=length(a);
stab=0;
while n>1,
 lam=a(n)/a(1);
 if abs(lam)>=1, return; end;
 ar=fliplr(a);
 n=n-1;
 a=a(1:n)-lam*ar(1:n);
 if mon==1, disp(a); end
 end
stab=1;
