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
 y=xt(1);                       % We will control the level in the last tank 

 % Here goes data update of Kalman filter
 
 
 % Controller goes her
 u=0;

 sdata=[sdata; t w y u];
 
 % ------------ Setup is changed here -------------------------------------                                         
 act2(u);                       % tank system with white process noise  
 %-------------------------------------------------------------------------

  % Here goes time update of Kalman filter
    

 
 Jc=Jc+(y-w)^2;
 Ju=Ju+(u)^2;
end
%-----------------------------------------------------------------------------
Jc=Jc/length(wt); Ju=Ju/length(wt);
fprintf('Jc = %f Ju = %f \n',Jc,Ju);
plt  % Plot signals
%plt2(P) % Plot states and their estimates
