function u=prbs(n,m)
%function u=prbs(n,m)
% n: length of sequence
% m: length of shiftregister

% Programmed by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

u=zeros(n,1);

x=(osc(m)+1)/2;
x=fix(x);

xor=[0 1; 1 0];

for i=1:n,
 y=xor(x(1)+1,x(2)+1);
 x(1:m-1)=x(2:m);
 x(m)=y;
 u(i)=y;
 end
 u=2*(u-0.5);
