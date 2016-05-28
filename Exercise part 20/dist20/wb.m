sflag=3; % System flag 0-3.
	 % Physical system (0), Discrete time linear model (1),
         % Continous time linear model (2), Nonlinear model (3)
         % test model (4)

w0=19;   % set point - operation point

global data t t0 	% some data and time administration
data=[];

ut=20*sqwave(length(wt),40);

[As,Bs,Cs,Ds,U0,X0,R1,R2]=sysinit(w0); % Determine linear model
%------------------------------------------------------------------------

measinit(sflag);		% Initilialise the measurement system
for it=1:length(wt),
 H=meas(sflag);
 u=ut(it);
 U=u+U0; 
 data=[data; t-t0 w+w0 H' U ];
 act(U,sflag);			 % Actuate control 
end

if sflag==0, 
 da_u1([U0 0]*0.01); 
else
 plt 				  % plot results
end;

