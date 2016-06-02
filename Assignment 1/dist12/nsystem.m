function [A B C D] = nsystem
% Usage: [A,B,C,D]=nsystem
%
%   dx = Ax+Bu+v
%   y = Cx
%

A = [1.8 1; -.95 0];
B = [1.5 0]';
C = [0.5 0];
D = 0;
