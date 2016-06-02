global data % some data and time administration
data=[]; Je=0; Ju=0;

dets=1; % deterministisk (1) eller stokastisk (0) simulation
%------------------------------------------------------------------------
[A,B,k,C,s2]=sysinit2(dets); % Determine linear model (ie. get system)
%------------------------------------------------------------------------
% Reference signal
%refsig=2; % 1-2
refsig=dets+1;
switch refsig,
 case 1, wt=zeros(100,1);
 case 2, wt=[zeros(30,1); ones(70,1)];
end
nstp=length(wt);
wft=wt;
%------------------------------------------------------------------------
% The fixed parameter controller
% ireg=0 Uncontrolled (u_t=0).
% ireg=1 MV0
% ireg=2 PZ
% ireg=3 MV1a
% ireg=4 MV1
% ireg=5 GSP (Poleplacement controller)
% Ireg=6 LQG
% ireg=7 MV2 
ireg=1;

if ireg==0,
 Q=0; S=0; R=1;

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

 act(u);			 % Actuate control 
 Xr=Ar*Xr+Br*[wf;-y];             % fixed parameter controller

 Je=Je+(w-y)^2; Ju=Ju+u^2;
end


%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------
plt 				  % plot results
Je=Je/nstp; Ju=Ju/nstp; % clc;
fprintf('Je = %f Ju = %f \n',Je,Ju);
%------------------------------------------------------------------------
signatur={'w->y','e->y','w->u','e->u'};
if dets,
 for ik=1:2:4,
  disp(' '); disp(signatur{ik})
  [acl,bcl,kcl]=clloop(A,B,k,C,R,S,Q,ik);
  trfshow(acl,bcl,kcl);
  pause
 end
else
 for ik=1:4,
  disp(' '); disp(signatur{ik})
  [acl,bcl,kcl]=clloop(A,B,k,C,R,S,Q,ik);
  trfshow(acl,bcl,kcl);
  if ik==2,
   fprintf('Variance of y %f \n',trfvar(acl,bcl)*s2);
  elseif ik==4,
   fprintf('Variance of u %f \n',trfvar(acl,bcl)*s2);
  end;
  pause
 end
end
