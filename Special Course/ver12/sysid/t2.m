% ----------------------------------------------------------------------
% Test af estpacf
% ----------------------------------------------------------------------

y=randn(1000,1);
y=filter(1,[1 -1.5 0.7],y);

estpacf(y,30);
%estacf(y,30);
print ideks21f.pps