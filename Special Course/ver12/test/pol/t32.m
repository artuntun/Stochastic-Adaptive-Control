disp('Test af polexp')
a=[2 2];
b=[2 -1 1];
n=7;
h=polexp(a,b,n)

pause
disp('Test mod impulse')
a=[1 0.9];
b=[0 1];
n=7;
t0=clock;
h=polexp(a,b,n);
etime(clock,t0)
t0=clock;
hi=dimpulse(b,a,n+1);
etime(clock,t0)
fprintf('\n');
disp([h hi])
