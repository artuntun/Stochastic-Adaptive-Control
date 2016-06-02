% -----------------------------------------------------------------------
% Fixed parameter Controller - Direct realization                       +
% -----------------------------------------------------------------------
global data % some data and time administration
data=[]; Je=0; Ju=0;

dets=0; % deterministisk (1) eller stokastisk (0) simulation
nstp=150;
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
ireg=0;

if ireg==0, % Uncontrolled situation
 Q=0; S=0; R=1;
elseif ireg==1,
 [Q,R,S,G]=dsnmv0(A,B,k,C);
elseif ireg==2,
 Am=[1 -0.417]; 
 Bm=sum(Am);    
 [Q,R,S,G]=dsnpz(A,B,k,C,Am,Bm);
elseif ireg==3,
 rho1=0.0;
 [Q,R,S,G]=dsnmv1a(A,B,k,C,rho1);
elseif ireg==4,
 rho2=0;
 [Q,R,S,G]=dsnmv1(A,B,k,C,rho2);
elseif ireg==5,
 Am=[1 -0.3]; 
 Bneg=1;
 Bpos=B;
 Bm1=sum(Am)/sum(Bneg); 
 [Q,R,S,G]=dsnpol(A,Bpos,Bneg,k,C,Am,Bm1);
elseif ireg==6,
 rho3=0.1;
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
nr=length([R Q S]); fir=zeros(nr,1); thr=[R Q S]';
pilr=1+[0 length(R) length([R Q])];
% pilr indicate where w_t and y_t enters fir (the regulator fi).
%------------------------------------------------------------------------
measinit;		        % Initilialise the measurement system
for it=1:nstp,
 w=wt(it); wf=wft(it);
 [y,t]=meas;                    % Measure output

 % Ru=Qw-Sy  or u=fir'*thr/thr(1)
 fir(2:end)=fir(1:end-1);
 fir(pilr)=[0 -wf y];
%  u=-fir'*thr/thr(1);
 u = w;
 fir(1)=u;

 data=[data; t w y u ];

 act(u);			 % Actuate control 
end


%------------------------------------------------------------------------
% Post mortem analysis
%------------------------------------------------------------------------
plt 				  % plot results
%------------------------------------------------------------------------
% signatur={'w->y','e->y','w->u','e->u'};
% for ik=1:4,
%  disp(' '); disp(signatur{ik})
%  [acl,bcl,kcl]=clloop(A,B,k,C,R,S,Q,ik);
%  trfshow(acl,bcl,kcl);
%  if rem(ik,2)==0, 
%   trfvar(acl,bcl)*s2
%  end
%  pause
% end
