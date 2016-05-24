mode=1;
fprintf('Check of trfvar trfnorm trfvar2 \n');

a=[1 0.7 0.5 -0.3];
c=[1 0.3 0.2 0.1];

%a=[1 0.5];
%c=[1 -0.3];

a=[1 0.7 0.5 -0.3];
c=1;

if mode==1,
 trfvar(a,c)
 trfvar2(a,c)
 trfnorm(a,c)
 acf(a,c,1,0)
else
 tic
 trfvar(a,c);
 toc
 tic
 trfvar2(a,c);
 toc
 tic
 trfnorm(a,c);
 toc
 tic
 r=acf(a,c,1,0);
 toc
end
