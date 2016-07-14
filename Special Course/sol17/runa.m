var=zeros(1,2);
dets=0; % deterministisk (1) eller stokastisk (0) simulation
%------------------------------------------------------------------------
[A,B,k,C,s2]=sysinit(dets); % Determine linear model (ie. get system)
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
% ireg=1;

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
 Am=[1 -0.999]; 
 Bneg=1;
 Bpos=B;
 Bm1=sum(Am)/sum(Bneg); 
 [Q,R,S,G]=dsngsp(A,Bpos,Bneg,k,C,Am,Bm1);

elseif ireg==6,
 %rho3=0;
 [Q,R,S]=dsnlqg(A,B,k,C,rho3);

elseif ireg==7,
 Ae=[1 -0.7];
 Be=1;
 Am=[1 -0.3];
 Bm=sum(Am);
 [Q,R,S,Bw,Aw]=dsnmv2(A,B,k,C,Bm,Am,Be,Ae);
end

jk=[2 4];
for ik=1:2,
 [acl,bcl,kcl]=clloop(A,B,k,C,R,S,Q,jk(ik));
 var(ik)=trfvar(acl,bcl)*s2;
end
