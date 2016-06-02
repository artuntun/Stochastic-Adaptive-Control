global data % some data and time administration
data=[];

vare=0;
%vare=0.1220;
%------------------------------------------------------------------------
[A,B,k,C]=sysinit(vare); % Determine linear model (ie. get system)
%------------------------------------------------------------------------
% Reference signal
refsig=2; % 1-2
switch refsig,
 case 1, wt=zeros(100,1);
 case 2, wt=[zeros(30,1); ones(70,1)];
end
nstp=length(wt);
%------------------------------------------------------------------------
% The fixed parameter controller 
% ireg=1 MV0
% ireg=2 PZ
% ireg=3 MV1a
% ireg=4 MV1
% ireg=5 GSP (Poleplacement controller)
% Ireg=6 LQG
% Ireg=7 MV2
ireg=7;

if ireg==1,
 [Q,R,S,G]=dsnmv0(A,B,k,C);

elseif ireg==2,
 %Am=[1 -0.9]; 
 %Bm=sum(Am);  
 beta=0.5;
 Am=[1 -beta];
 Bm=1-beta;
 [Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);

elseif ireg==3,
 rho1=0.1;
 %rho1=0;
 [Q,R,S,G]=dsnmv1a(A,B,k,C,rho1);

elseif ireg==4,
 rho2=0.01;
 %rho2=0; % [0 1 5 50]
 [Q,R,S,G]=dsnmv1(A,B,k,C,rho2);

elseif ireg==5,
 %Am=[1 -0.3]; 
 %Bneg=1;
 %Bpos=B;   %PZ-reg
 %Bm1=sum(Am)/sum(Bneg); 
 beta=0.5;
 Am=[1 -beta];
 Bneg=B;
 Bpos=1;
 Bm1=sum(Am)/sum(Bneg);
  [Q,R,S,G]=dsngsp(A,Bpos,Bneg,k,C,Am,Bm1);

elseif ireg==6,
 rho3=10;
 %rho3=0;
 [Q,R,S]=dsnlqg(A,B,k,C,rho3);

elseif ireg==7,
  gamma=0.3; beta=0.9;

  Ae=[1 -gamma]; Am=[1 -beta];
  Be=1; Bm=sum(Am);
  By=Ae; Ay=Be;

  Aw=conv(Am,Be);
  Bw=conv(Bm,Ae);

  Bu=0; Au=1;
  rho=0;

  [Q,R,S,G] = dsngmv(A,B,k,C,By,Ay,Bw,Aw,rho,Bu,Au)
  wft=filter(Bw,Aw,wt);
end
%------------------------------------------------------------------------
[Ar,Br,Cr,Dr]=armax2ss(R,Q,0,S); 
nr=length(Ar); Xr=zeros(nr,1); 
%------------------------------------------------------------------------
measinit;		% Initilialise the measurement system
y2=0;
u2=0;
for it=1:nstp,
 w=wt(it); wf=wft(it);
 [y,t]=meas;

 u=Cr*Xr+Dr*[wf;-y];             % Fixed parameter controller
 %u=w;

 data=[data; t w y u ];
 
 y2=y*y+y2;
 u2=u*u+u2;

 act(u);			 % Actuate control 
 Xr=Ar*Xr+Br*[wf;-y];             % fixed parameter controller
end

mvary=y2/nstp;       % Giver mvary=0.1226
mvaru=u2/nstp;       % Giver mvaru mellem 30 og 120

%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------
plt 				  % plot results
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
