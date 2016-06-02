c=[1 5];
a=[1 -0.3];

cv=[0.372 -0.256];
av=[1 -0.94];

[as,bs]=sd2spec(av,cv)

psic=conv(cv,conv(bs,fliplr(cv)))


