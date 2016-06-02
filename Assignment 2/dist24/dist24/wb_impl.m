% -----------------------------------------------------------------------------
% Implicite Adaptive Control                                                  +
% -----------------------------------------------------------------------------
global data datath datap; % some data and time administration
data=[]; datath=[]; datap=[];

dets=1; % deterministisk (1) eller stokastisk (0) simulation
nstp=100;
%------------------------------------------------------------------------
[A,B,k,C,s2]=sysinit(dets); % Determine linear model (ie. get system)
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
% Auxilary filter
Am=[1 -0.6]; 
Bm=sum(Am);    
[Ax,Bx,Cx,Dx]=armax2ss(1,Bm,k,Am);
nx=length(Ax); Xm=zeros(nx,1);
%------------------------------------------------------------------------
% Apriori design
[Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);
nr=length([R Q S]); 
fi=zeros(nr,1); 
th=[R Q S]'; 
th0=th;
%th=th*0; % Reset the estimate to zero
pil=1+[0 length(R) length([R Q])]; % Indicator
p0=10000;
P=eye(nr)*p0;
th(pil(2))=Q(1); 	% First coefficient in Q=C*Bm is known
P(pil(2),pil(2))=0;
%------------------------------------------------------------------------
measinit;		        % Initilialise the measurement system
for it=1:nstp,
 w=wt(it); 
 [y,t]=meas;                    % Measure output
 xi=Cx*Xm+Dx*[-w;y];

 % ID block
 res=xi-fi'*th;
 %lam=1-res^2/(1+fi'*P*fi)/N/s2;
 K=P*fi/(1+fi'*P*fi);
 P=P-K*fi'*P;
 th=th+K*res; % th'

 % fi administration 
 fi(2:end)=fi(1:end-1);
 fi(pil)=[0 -w y]';

 % Determine the control
 u=-fi'*th/th(1);
 fi(pil(1))=u;      

 data=[data; t w y u ];
 datath=[datath; t th'];
 datap=[datap; t trace(P)];

 act(u);			 % Actuate control 
 Xm=Ax*Xm+Bx*[-w;y];		 % Update auxilary filter
end

%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------
plt 				  % plot results
%------------------------------------------------------------------------
return

signatur={'w->y','e->y','w->u','e->u'};
for ik=1:4,
%for ik=2:2:4,
 disp(' '); disp(signatur{ik})
 [acl,bcl,kcl]=clloop(A,B,k,C,R,S,Q,ik);
 trfshow(acl,bcl,kcl);
 if rem(ik,2)==0, 
  trfvar(acl,bcl)*s2
 end
 pause
end
