global Stsys % Simulation system (Ssys) accessible through global

global time

global sdata edata % data for plotting

sdata=[]; edata=[];

Jc=0; Ju=0;             % Initilize cost functions (error (c) and effort (u))



wt=zeros(10000,1); nstp=length(wt);

%------------------------------------------------------------------

[Dtsys]=sysinit2; % Start simulation system and get Design system (Dsys)



%------------------------------------------------------------------

% Controller design goes here
Q1 = C'*C;
Q2 = 0.01;
[L,S,e] = dlqr(A,B,Q1,Q2);



%------------------------------------------------------------------

% Filter design and initiliazation goes here
[K,P,Z,E] = dlqe(A,B,Cm,R1,R2);
P_err_infty = Z; 
x0 = [0;0];
x_predict = x0;
x_estim_stored = [];


measinit

%-----------------------------------------------------------------------------

% Start loop

%-----------------------------------------------------------------------------

for it=1:nstp,

 w=wt(it);                      % Reference signal

 [ym,t]=meas;                   % Measure data

 xt=Stsys.sim.X;                % The variable xt contains the true tank states.

 y=xt(1);                       % We will control the level in the last tank 



 % Here goes data update of Kalman filter

 x_estim = x_predict + K*(ym-Cm*x_predict);
 x_estim_stored = [x_estim_stored x_estim];

 % Controller goes her

 u=-L*x_estim;


 sdata=[sdata; t w y u];

 

 % ------------ Setup is changed here -------------------------------------                                         

 act2(u);                       % tank system with white process noise  

 %-------------------------------------------------------------------------



 % Here goes time update of Kalman filter
 x_predict = A*x_estim + B*u;  
    



 

 Jc=Jc+(y-w)^2;

 Ju=Ju+(u)^2;

end

%-----------------------------------------------------------------------------

Jc=Jc/length(wt); Ju=Ju/length(wt);

fprintf('Jc = %f Ju = %f \n',Jc,Ju);

% plt  % Plot signals

%plt2(P) % Plot states and their estimates

