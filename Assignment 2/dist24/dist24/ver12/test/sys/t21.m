clc; disp('Test af acfma (acf for MA-processer)')

c=[1 -1];
c=polmul([1 -0.4],[1 0.8]);
%a=[1 0.8];
%c=dimpulse(1,a,8);
[ry,rye,t]=acfma(c,1,4);

clf
subplot(221)
bar(t,ry)
grid
subplot(223)
bar(t,rye)
grid

