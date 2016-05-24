% -----------------------------------------------------------------------
% Test af:
%           estacf
%           pergram
% -----------------------------------------------------------------------


y=randn(100,1);
y=filter(1,[1 -1.5 0.7],y);

estacf(y);
title('Autocorrelation function')
ylabel('lag')
% print ideks21a.pps
% print ideks21c.pps

pause
pergram(y);
title('Cumulated periodogram');
ylabel('power')
xlabel('frequency')
% print ideks21b.pps
% print ideks21d.pps
