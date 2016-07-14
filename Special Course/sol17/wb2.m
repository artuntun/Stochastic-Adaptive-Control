global data % some data and time administration
data=[]; Je=0; Ju=0;

%dets=1; % deterministisk (1) eller stokastisk (0) simulation
%------------------------------------------------------------------------
[A,B,k,C,s2]=sysinit2(dets); % Determine linear model (ie. get system)
%------------------------------------------------------------------------
% Reference signal
refsig=3; % 1-5
switch refsig,
 case 1, wt=zeros(1000,1);			% zero
 case 2, wt=[zeros(30,1); ones(70,1)];		% Step function
 case 3, wt=prbs(100,15);			% PRBS
 case 4, wt=sqwave(100,25);			% square wave
 case 5, wt=randn(100,1);			% white noise
end
nstp=length(wt);
wft=wt;
%------------------------------------------------------------------------
% The fixed parameter controller
% ireg=-1 Uncontrolled (u_t=0).
% ireg=0  ut=wt (exitattion)
% ireg=1  MV0
% ireg=2  PZ
% ireg=3  MV1a
% ireg=4  MV1
% ireg=5  GSP (Poleplacement controller)
% Ireg=6  LQG
% ireg=7  MV2 
ireg=0;

if ireg==-1,
 Q=0; S=0; R=1;

elseif ireg==0,
 Q=1; S=0; R=1;

elseif ireg==1,
 [Q,R,S,G]=dsnmv0(A,B,k,C);

elseif ireg==2,
 Am=[1 -0.9]; 
 Bm=sum(Am);    
 [Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);

elseif ireg==3,
 rho1=0;
 [Q,R,S,G]=dsnmv1a(A,B,k,C,rho1);

elseif ireg==4,
 rho2=0;
 [Q,R,S,G]=dsnmv1(A,B,k,C,rho2);

elseif ireg==5,
 Am=[1 -0.3]; 
 Bneg=1;
 Bpos=B;
 Bm1=sum(Am)/sum(Bneg); 
 [Q,R,S,G]=dsngsp(A,Bpos,Bneg,k,C,Am,Bm1);

elseif ireg==6,
 rho3=0;
 [Q,R,S]=dsnlqg(A,B,k,C,rho3);
elseif ireg==7,
 Ae=[1 -0.7];
 Be=1;
 Am=[1 -0.3];
 Bm=sum(Am);
 [Q,R,S,Bw,Aw]=dsnmv2(A,B,k,C,Bm,Am,Be,Ae);
 wft=filter(Bw,Aw,wt);
end
%------------------------------------------------------------------------
[Ar,Br,Cr,Dr]=armax2ss(R,Q,0,S); 
nr=length(Ar); Xr=zeros(nr,1); 
%------------------------------------------------------------------------
measinit;		% Initilialise the measurement system
for it=1:nstp,
 w=wt(it); wf=wft(it);
 [y,t]=meas;

 u=Cr*Xr+Dr*[wf;-y];             % Fixed parameter controller
 %u=w;

 data=[data; t w y u ];

 act(u);	 		 % Actuate control 
 Xr=Ar*Xr+Br*[wf;-y];             % fixed parameter controller

 Je=Je+(w-y)^2; Ju=Ju+u^2;
end


%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------
plt 				  % plot results
%Je=Je/nstp; Ju=Ju/nstp; clc;
%fprintf('Je = %f Ju = %f \n',Je,Ju);
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
