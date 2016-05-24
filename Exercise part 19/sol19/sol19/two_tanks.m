function [A,B,C,D,K,X0] = two_tanks(pars,T,aux)


a1   = pars(1);
a2   = pars(2);

x1_0    = aux(1);
x2_0    = aux(2);
C       = aux(3);

% keyboard;

A   = [ -a1      a2; a1      -2*a2]*[1/(2*x1_0^.5)  0; 0        1/(2*x2_0^.5)];


B   = [
        0   
        1/C];
    
C   = [ 1       1
        1       0];
    
D   = zeros(2,1);

K   = zeros(2,2);
X0  = zeros(2,1);