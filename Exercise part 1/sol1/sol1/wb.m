sflag=1; % System flag 0-3.
	 % Physical system (0), Discrete time linear model (1),
         % Continous time linear model (2), Nonlinear model (3)

global spm
%spm=11; % Which question are we solving (spm=11 ... 16)
         % Here it has been disabled because spm is set in solution

w0=19;   % set point - operation point

global data t t0                  % some data and time administration
data=[];

wt=[zeros(1,20) 5*ones(1,500)];   % variation (from w0) in set point

[As,Bs,Cs,Ds,U0,X0]=sysinit(w0);  % Determine linear model 
ns=length(As);
if spm<14, return; end;           % We will not do a simulation in the 
                                  % first 3 questions.

% design of controller goes here
if spm==15,
 echo on
 Q=eye(ns); R=0.01;
 L=dlqr(As,Bs,Q,R)
 echo off
 return
end

if spm==16,
 Q=eye(ns); R=0.01;
 L=dlqr(As,Bs,Q,R);
 echo on
 Acl=As-Bs*L;
 DC=Cs*inv(eye(ns)-Acl)*Bs;
 M=1/DC
 echo off
end

measinit(sflag); 	 	% Initilialise the measurement system
for it=1:length(wt),
 w=wt(it);
 h=meas(sflag);			% Measure levels
 X=[h(2);h(1)-h(2)];
 Y=h(2);
 x=X-X0;

 u=0; % controller goes here
 if spm==14, u=w; end;
 if spm==16, u=M*w-L*x; end;
 
 U=u+U0; 
 data=[data; t-t0 w+w0 h' U ];
 act(U,sflag);			 % Actuate control 
end

if sflag==0, 
 da_u1([U0 0]*0.01); 
else
 plt 				  % plot results
end;

if spm==14 | spm==16,
 figure(2);
 t=data(:,1);
 y=data(:,4);
 clf;
 fprintf('Rise time for system \n');
 trise(t,y,1)
end
