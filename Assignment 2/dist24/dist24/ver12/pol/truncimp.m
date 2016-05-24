function [x,y]=truncimp(a,k,c)
%Usage: [x,y]=truncimp(a,k,c)
%
% Solves the special version of the Diaphantine equation:
%
%             AX+q^{-k}Y=C
%
% This implementation uses the truncated impulse method

% Programmed 2002 by Niels K. Poulsen
% Informatics and Mathematical Modelling,
% Technical University of Denmark

x=sysimp(a,c,k-1)';
y=polsum(c,-polmul(a,x));
y=polclr(y(k+1:end));
