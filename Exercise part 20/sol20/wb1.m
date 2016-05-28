sflag=1; % System flag 0-3.
	 % Physical system (0), Discrete time linear model (1),
         % Continous time linear model (2), Nonlinear model (3)
         % test model (4,5)

w0=19;   % set point - operation point
if sflag==4, w0=0; end; % test
if sflag==5, w0=0; end; % test

global data t t0 	% some data and time administration
data=[];

wt=[zeros(1,0) 0*ones(1,500)]; % variation (from w0) in set point
%ut=20*prbs(length(wt),12);
ut=20*sqwave(length(wt),40);

[As,Bs,Cs,Ds,U0,X0,R1,R2]=sysinit(w0); % Determine linear model
ns=length(As);
[den,num]=ss2tf(As,Bs,Cs,Ds,1);
%------------------------------------------------------------------------
[b,a]=ss2tf(As,Bs,Cs,Ds,1)
P=dare(As',Cs',R1,R2);
[m1,p1,z1,e1]=dlqe(As,eye(length(As)),Cs,R1,R2);
K=As*P*Cs'*inv(R2+Cs*P*Cs');
[c,a]=ss2tf(As,K,Cs,1,1)
%------------------------------------------------------------------------

measinit(sflag);		% Initilialise the measurement system
for it=1:length(wt),
 w=wt(it);
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

y=data(:,4); % -X0(1);
u=data(:,5); % -U0;
z=[y u];
z=dtrend(z);
%th=armax(z,[2 2 2 1]);
%present(th)

