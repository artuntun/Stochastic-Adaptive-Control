%% Initialization
clear all
close all
startup

%% Question 1.1
 [A,B,C,D,R1,Cm,R2] = tsystem;
 etha = R1;
 Q = B*R1*B';
 Px_inf = dlyap(A,Q);
 Py_inf = C*Px_inf*C';
 
%% Question 1.2

realizations = [];
for i = 1:100
    wb2
    yt = sdata(:,3);
    realizations = [realizations yt];
end 
%% plotting of question 1.2
plot(time,-3*sqrt(Py_inf),time,3*sqrt(Py_inf),'color','b','LineWidth',2)
time = 1:10000;
for i = 1:length(realizations)
    hold on
    plot(time,realizations(:,i),'color',rand(1,3))
    hold off
end

%% Question 1.3
Q1 = C'*C;
Q2 = 0.01;
[K,S,e] = dlqr(A,B,Q1,Q2);
Q = B*R1*B';
Pxcl_infty = dlyap(A-B*K,Q);
Pycl_infty = C*Pxcl_infty*C';
Pu_infty = K*Pxcl_infty*K';

%% Question 1.4
bdata = [];
cdata = [];
for j = 1:100
    wb_p4;
    bdata= [bdata;sdata(:,3)];
    cdata= [cdata;sdata(:,4)];
end
Py_con = var(bdata);
y_mean_con = mean(bdata);
Pu_con = var(cdata);
u_mean = mean(cdata);

%% Question 1.5
% [M,P,Z,E] = dlqe(A,B,Cm,R1,R2);
wb_q6
% P_err_infty = Z;
nplot = 150;
t = 1:nplot;
real_x1  = sdata(:,3);
meas_x1 = sdata(:,5);
estim_x1 = sdata(:,6);

plot(t,real_x1(1:nplot),t,meas_x1(1:nplot),t,estim_x1(1:nplot))
legend('real x_1', 'measured x_1', 'estimated x_1')
grid


disp('hit key')
pause
plot(t,real_x1(1:nplot),t,estim_x1(1:nplot))
legend('real x_1', 'estimated x_1')
grid

disp('hit key')
pause
nplot = 6000;
plot(1:nplot,real_x1(1:nplot),1:nplot,estim_x1(1:nplot))
legend('real x_1', 'estimated x_1')
grid
