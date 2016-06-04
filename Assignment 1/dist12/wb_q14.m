global Stsys Snsys % Simulation system (Ssys) accessible through global

global time

global sdata edata % data for plotting

sdata=[]; edata=[];

Jc=0; Ju=0;             % Initilize cost functions (error (c) and effort (u))



wt=zeros(10000,1); nstp=length(wt);

%------------------------------------------------------------------

[Dtsys Dnsys]=sysinit; % Start simulation system and get Design system (Dsys)


%------------------------------------------------------------------

% Controller design goes here
[A B C D R1 Cm R2] = tsystem; %%System dynamics
[Aw,Bw,Cw,Dw]=nsystem; %%Noise dynamic
A_aug = [A,B*Cw;zeros(size(A)),Aw];  
B_aug = [B; zeros(size(B))];
C_aug = [C zeros(size(C))];
Q1 = [C'*C,zeros(size(A));zeros(size(A)),zeros(size(A))];
Q2 = 0.01;
[L,S,e] = dlqr(A_aug,B_aug,Q1,Q2);


%------------------------------------------------------------------

% Filter design and initiliazation goes here



measinit

%-----------------------------------------------------------------------------

% Start loop

%-----------------------------------------------------------------------------

for it=1:nstp,

 w=wt(it);                      % Reference signal

 [ym,t]=meas;                   % Measure data

 xt=Stsys.sim.X;                % The variable xt contains the true tank states.

 xn=Snsys.sim.X;                % The variabel xn contains the true noise states

 y=xt(1);                       % We will control the level in the last tank 

%  eta = Cw*xn;

 % Here goes data update of Kalman filter
 
 

 

 % Controller goes her

 u=-L*[xt;xn];



 sdata=[sdata; t w y u];

 

 % ------------ Setup is changed here -------------------------------------                                         

 act(u);                          % tank system with structured process noise

 % act2(u);                       % tank system with white process noise  

 %-------------------------------------------------------------------------



  % Here goes time update of Kalman filter

    



 

 Jc=Jc+(y-w)^2;

 Ju=Ju+(u)^2;

end

% %-----------------------------------------------------------------------------
% 
% Jc=Jc/length(wt); Ju=Ju/length(wt);
% 
% fprintf('Jc = %f Ju = %f \n',Jc,Ju);
% 
% plt  % Plot signals
% 
% %plt2(P) % Plot states and their estimates

