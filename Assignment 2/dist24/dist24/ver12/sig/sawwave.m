function y=sawwave(len,per);
%Usage: y=sawwave(len,per);
%
% Generates a saw wave of length len. Periode is spcified
% per.

u=[0; sqwave(len-1,per)/per];
y=cumsum(u);
