%% Initialization
clear all
close all
startup

%% Question 2.1

h = tf([0 0.06],[1 -2.36 2.16 -0.74],1.5,'variable','z^-1');
step(h)
grid

%% Question 2.2

pzmap(h)

%% Question 2.4
wb_23
R
Q
S
%% Question 2.5

wb_25
t = data(:,1);
exper_Je = data(:,5);
exper_Ju = data(:,6);
theor_Je = (1:length(t))*s2;
theor_Ju = (1:length(t))*trfvar(acl,bcl)*s2;

subplot(211);
plot(t,exper_Je,t,theor_Je,'-'); grid; ylabel('J_e'); xlabel('t in sec');
title('Accumulated losses');
legend('experimental J_e', 'theoretical J_e');
subplot(212);
plot(t,exper_Ju,t,theor_Ju,'-'); grid; ylabel('J_u'); xlabel('t in sec');
legend('experimental J_u', 'theoretical J_u');
nstp=length(wt);
Je=Je(end)/nstp; Ju=Ju(end)/nstp; clc;
fprintf('Je = %f Ju = %f \n',Je,Ju);

disp('theortical Ju')
Ju = trfvar(acl,bcl)*s2
disp('theoretical Je')
Je = s2

%% Question 2.7
wb_27
output = data(:,3); 
input = data(:,4);
%%%%%%%% Iterative coefficient estimation %%%%%%%%%%%%%%%%%%%%%%%%%%
parametes = itereatCoeffi(output, input)
%% plotting evolution of coefficients
plot(parameters(:,1)); grid
hold on
plot(parameters(:,2));
plot(parameters(:,3));
plot(parameters(:,4));
legend('a_1','a_2', 'a_3', 'b_1')
hold off

%% Question 2.7 with PZ
wb_27_2
output = data(:,3); 
input = data(:,4);
parameters = itereatCoeffi(output, input)
%% Plotting 
plot(parameters(:,1)); grid
hold on
plot(parameters(:,2));
plot(parameters(:,3));
plot(parameters(:,4));
legend('a_1','a_2', 'a_3', 'b_1')
hold off



