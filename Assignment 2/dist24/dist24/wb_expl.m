% -----------------------------------------------------------------------------
% Explicite Adaptive Control                                                   +
% -----------------------------------------------------------------------------
global data datath datap; % some data and time administration
data=[]; datath=[]; datap=[];

dets=1; % deterministisk (1) or stokastisk (0) simulation
nstp=100;
%------------------------------------------------------------------------
[A,B,k,C,s2]=sysinit(dets); % Determine linear model (ie. get system)
%------------------------------------------------------------------------
% Initialize estimation
na=length(A)-1; nb=length(B)-1; nc=length(C)-1;

th=[A(2:end) B C(2:end)]'; th0=th;
th=diag((1+0.5*randn(size(th))))*th;  
%th=th*0;

pil=[na nb+1]; pil=[0 cumsum(pil)]+1; % indicator
fi=zeros(size(th));

p0=10000;
P=eye(size(th,1))*p0;
%------------------------------------------------------------------------
% Reference signal
refsig=4; % 1-3
switch refsig,
 case 1, wt=zeros(nstp,1);
 case 2, wt=stepf(nstp,30);
 case 3, wt=sqwave(nstp,25);
 case 4, wt=prbs(nstp,10);
end
nstp=length(wt);
%------------------------------------------------------------------------
% Apriori design (based on system)
 Am=[1 -0.6]; 
 Bm=sum(Am);    
 [Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);
%------------------------------------------------------------------------
% Controller administration
nr=length([R Q S]); 
thr=[R Q S]'; 		% Controller parameters
fir=zeros(nr,1); 	% Controller regressor 
pilr=1+[0 length(R) length([R Q])];	% Indicator
%------------------------------------------------------------------------
% ********** Main loop **************************************************
%------------------------------------------------------------------------
measinit;		        % Initilialise the measurement system
for it=1:nstp,
 w=wt(it); 
 [y,t]=meas;                    % Measure output

 % ID block -------------------------------------------------------------
 res=y-fi'*th;
 %lam=1-res^2/(1+fi'*P*fi)/N/s2;
 K=P*fi/(1+fi'*P*fi);
 P=P-K*fi'*P;
 th=th+K*res; % th'

 % Design block ---------------------------------------------------------
 A=[1 th(1:na)']; B=th(pil(2):pil(3)-1)'; C=[1 th(pil(3):end)'];
 [Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);
 thr=[R Q S]'; 

 % Ru=Qw-Sy  ---- Controller --------------------------------------------
 fir(2:end)=fir(1:end-1);
 fir(pilr)=[0 -w y];
 u=-fir'*thr/thr(1);
 fir(1)=u;

 % fi administration ----------------------------------------------------
 fi(2:end)=fi(1:end-1);
 fi(pil(1:2))=[-y u]';

 data=[data; t w y u ];	% Data aquisition -------------------------------
 datath=[datath; t th'];
 datap=[datap; t trace(P)];

 act(u);	 % Actuate control -------------------------------------
end


%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------

plt 				  % plot results
%------------------------------------------------------------------------

signatur={'w->y','e->y','w->u','e->u'};
for ik=1:4,
 disp(' '); disp(signatur{ik})
 [acl,bcl,kcl]=clloop(A,B,k,C,R,S,Q,ik);
 trfshow(acl,bcl,kcl);
 if rem(ik,2)==0, 
  trfvar(acl,bcl)*s2
 end
 pause
end
