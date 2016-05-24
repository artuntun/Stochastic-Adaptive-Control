function pergram(y,Ts)
% Usage: pergram(y,Ts)
%        pergram(y)
%
% Perform a spectral analysis on the accumulated spektrum. 
%
% If sampling period Ts is omitted it is set to 1.

% Home: sysid
% Testfile: t1.m

n=length(y);
if nargin<2, Ts=1; end;

nqfrek=0.5/Ts;
f=0:nqfrek/n:nqfrek; f=f(:); f=f(1:end-1);
x=fft(y)/n;
z=abs(x).^2;
perdg=cumsum(z);
plot(f,perdg);
aks=axis;

hold on
f0=[0 f(end)]';
l0=[0 sum(y.^2)/n]';
q=(n-1)/2; 
K1=1.63; K5=1.36;
l=[l0 l0+K1/sqrt(q) l0-K1/sqrt(q) l0-K5/sqrt(q) l0+K5/sqrt(q)];
plot(f0,l);
axis(aks);
hold off
grid;
ylabel('acc. power');
xlabel('frequency')

%[sum(y.^2)/n perdg(end)]

