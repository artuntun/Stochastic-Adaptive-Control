function y=vecrev(x)
%Usage:  y=vecrev(x)
% 
% Reverse a vector, x.
[n,m]=size(x);
if n>m
 y=fliplr(x);
else 
 y=flipup(x);
end;
