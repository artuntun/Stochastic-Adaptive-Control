a=[1 -0.9];
a=1;
c=1;
c=[1 0.9];
[ma,mc]=spec(a,c);
[ac,cc]=spec2sd(ma,mc)
specplt(ac,cc)
