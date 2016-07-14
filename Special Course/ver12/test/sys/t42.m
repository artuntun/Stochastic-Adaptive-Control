disp('test af sfak')
c=1;
%c=polmul(c,[1 -9]);
c=polmul(c,[1 0.3]);
%c=polmul(c,[1 1.2]);
disp(c)
m=spec(c);

cs=sfak(m);
disp(cs)
disp('----------------------------')

disp(m)
disp(spec(cs))
disp('----------------------------')
