%-----------------------------------------------------------------------------
sflag=1; % System flag 0-3.
	 % Physical system (0), Discrete time linear model (1),
         % Continous time linear model (2), Nonlinear model (3)
%-----------------------------------------------------------------------------

w0=19;   % set point - operation point

global data t t0 % some data and time administration
data=[];

wt=[zeros(1,20) 5*ones(1,200)]; % variation (from w0) in set point

[As,Bs,Cs,Ds,U0,X0]=sysinit(w0); % Determine linear model
ns=length(As);

% design of controller goes here

measinit(sflag,X0); 		 % Initilialise the measurement system
%-----------------------------------------------------------------------------
% Simulation loop starts
%-----------------------------------------------------------------------------
for it=1:length(wt),
 w=wt(it);
 h=meas(sflag);			 % Measure levels
 X=[h(2);h(1)-h(2)];
 Y=h(2);
 x=X-X0;

 u=0; % controller goes here
 
 U=u+U0; 
 data=[data; t-t0 w+w0 h' U ];

 act(U,sflag);			 % Actuate control 
end
%-----------------------------------------------------------------------------
% Simulation loop ends
%-----------------------------------------------------------------------------

if sflag==0, 
 da_u1([U0 0]*0.01);              % stops D/A converter (if applied)
else
 plt 				  % plot results
end;
