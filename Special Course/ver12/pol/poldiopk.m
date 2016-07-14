function [x,y]=poldioph(a,k,c);

% Programmed 1994 by Niels K. Poulsen
% Department of Mathematical Modelling,
% Technical University of Denmark

%testfil: t35.m

x=polexp(c,a,k)';
disp(x)
z=-polmul(a,x);
y=polsum(c,z);
disp(y)
end

