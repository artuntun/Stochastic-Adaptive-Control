function [a,b,c,f,d,k]=pshow(th)
a=th.a;
if length(a)>1,
 fprintf('A = ');
 for i=1:length(a),
  fprintf('%8.4f ',a(i));
 end;
 fprintf('\n');
end;

b=th.b;
if length(b)>0,
 fprintf('B = ');
 for i=1:length(b),
  fprintf('%8.4f ',b(i));
 end;
 fprintf('\n');
end

f=th.f;
if length(f)>1,
 fprintf('F = ');
 for i=1:length(f),
  fprintf('%8.4f ',f(i));
 end;
 fprintf('\n');
end

c=th.c;
if length(c)>1,
 fprintf('C = ');
 for i=1:length(c),
  fprintf('%8.4f ',c(i));
 end;
 fprintf('\n');
end

d=th.d;
if length(d)>1,
 fprintf('D = ');
 for i=1:length(d),
  fprintf('%8.4f ',d(i));
 end;
 fprintf('\n');
end


