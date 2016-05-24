global data % some data and time administration
data=[];
%------------------------------------------------------------------------
[A,B,k,C,s2]=sysinit; % Determine linear model (ie. get system)
%------------------------------------------------------------------------
% Reference signal
refsig=2; % 1-2
switch refsig,
 case 1, wt=zeros(100,1);
 case 2, wt=[zeros(30,1); ones(70,1)];
end
nstp=length(wt);
%------------------------------------------------------------------------
% The fixed parameter controller (PZ controller)
ireg=6;
if ireg==1,
 [Q,R,S,G]=dsnmv0(A,B,k,C);

elseif ireg==2,
 Am=[1 -0.9]; 
 Bm=sum(Am);    
 [Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);

elseif ireg==3,
 rho1=5;
 %rho1=0;
 [Q,R,S,G]=dsnmv1a(A,B,k,C,rho1);

elseif ireg==4,
 rho2=1;
 %rho2=0; % [0 1 5 50]
 [Q,R,S,G]=dsnmv1(A,B,k,C,rho2);

elseif ireg==5,
 Am=[1 -0.3]; 
 %Am=A;
 %Am=1;
 Bneg=1;
 Bpos=B;
 Bm1=sum(Am)/sum(Bneg); 
 [Q,R,S,G]=dsnpol(A,Bpos,Bneg,k,C,Am,Bm1);

elseif ireg==6,
 %rho3=1e6;
 %rho3=0;
 [Q,R,S]=dsnlqg(A,B,k,C,rho3);
end
%------------------------------------------------------------------------
[Ar,Br,Cr,Dr]=armax2ss(R,Q,0,S); 
nr=length(Ar); Xr=zeros(nr,1); 
%------------------------------------------------------------------------
measinit;		% Initilialise the measurement system
for it=1:nstp,
 w=wt(it);
 [y,t]=meas;

 u=Cr*Xr+Dr*[w;-y];             % Fixed parameter controller
 %u=w;

 data=[data; t w y u ];

 act(u);			 % Actuate control 
 Xr=Ar*Xr+Br*[w;-y];             % fixed parameter controller
end


%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------
plt 				  % plot results
%------------------------------------------------------------------------
signatur={'w->y','e->y','w->u','e->u'};
for ik=1:4,
%for ik=2:2:4,
 disp(' '); disp(signatur{ik})
 [ap,bp,kp]=clloop(A,B,k,C,R,S,Q,ik);
 trfshow(ap,bp,kp);
 %abs(roots(ap))
 pause
end
