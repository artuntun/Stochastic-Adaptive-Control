b=[2 -1]
a=[1 -0.8]
s2=1

tf(b,a,1)

[as,bs]=spec(a,b);
as
bs=bs*s2

[asd,bsd]=spec2sd(as,bs)


pause

b=[1 -0.5]
s2=4

tf(b,a,1)

[as,bs]=spec(a,b);
as
bs=bs*s2

[asd,bsd]=spec2sd(as,bs)

pause
clc

bsd=[0.372 -0.256]
bs=sd2spec(bsd)
b=sfak(bs)

s2=b(1)^2
b=b/b(1)

bs=spec(b)*s2

bsp=spec2sd(bs)

pause
clc

bsd=[0.372 -0.256]
asd=[1 -0.94]

[as,bs]=sd2spec(asd,bsd)

a=sfak(as)
b=sfak(bs)

a0=a(1)
a=a/a0
b=b/a0

s2=b(1)^2
b=b/b(1)

[as,bs]=spec(a,b)
bs=bs*s2

[asd,bsd]=spec2sd(as,bs)

bsd=bsd/asd(1)
asd=asd/asd(1)
