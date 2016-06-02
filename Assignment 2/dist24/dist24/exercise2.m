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
trfvar(acl,bcl)*s2
disp('theoretical Je')
s2

%% Question 2.7
wb_27
output = data(:,3); 
input = data(:,4);
%%%%%%%% Iterative coefficient estimation %%%%%%%%%%%%%%%%%%%%%%%%%%
parameters = [];
ye = [output(1:10)];
ue = [input(1:10)];
for i = 11:length(output)
 ye = [ye;output(i)]; 
 ue = [ue;input(i)];
 ze=[ye ue];
 Ze = dtrend(ze);
 SYS = armax(Ze, [3 1 0 1]);
 [parm p] = th2par(SYS);
 parameters = [parameters; parm'];
end
