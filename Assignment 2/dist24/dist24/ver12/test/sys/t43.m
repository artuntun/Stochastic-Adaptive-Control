disp('test of spec2sd')
c=1;
c=polmul(c,[1 -9]);
c=polmul(c,[1 0.3]);
c=polmul(c,[1 1.2]);
m=spec(c)
sd=spec2sd(m)
sd2spec(sd)
