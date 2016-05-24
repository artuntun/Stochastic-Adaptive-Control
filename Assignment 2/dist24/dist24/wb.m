p0=10000;  	% Initial value of P (= p0*I)
N=20;		% equivalent horizon

lam=1-1/N; 	% Forgetting factor.
lam=1; 

r1=0.1;		% R1=r1*I
r1=0;
%------------------------------------------------------------------------
global data t  		  % some data and time administration
global datath datap
data=[]; datath=[]; datap=[];
%------------------------------------------------------------------------
runinit
[A,B,k,C,s2]=sysinit; % Determine linear model
%------------------------------------------------------------------------
refsig=3; % 1-5
switch refsig,
 case 1, wt=zeros(nstp,1);
 case 2, wt=ones(nstp,1);
 case 3, wt=sqwave(nstp,25);
 case 4, wt=prbs(nstp,15);
 case 5, wt=randn(nstp,1);
end
%------------------------------------------------------------------------
th=[A(2:end) B C(2:end)]';  th=diag((1+0.1*randn(size(th))))*th; th=th*0;
pil=[length(A)-1 length(B)];
pil=[0 cumsum(pil)]+1;
fi=zeros(size(th));
P=eye(size(th,1))*p0;
R1=eye(length(th))*r1;
R1=eye(length(th))*0; R1(3,3)=r1;
%------------------------------------------------------------------------
ndel=length(fi)+2;
%ndel=0;
wt=[zeros(ndel,1); wt];
%------------------------------------------------------------------------
measinit;		% Initilialise the measurement system
for it=1:nstp,
 y=meas;
 u=wt(it);

 res=y-fi'*th;
 %lam=1-res^2/(1+fi'*P*fi)/N/s2; % for the Fortescue type of forgetting.
 K=P*fi/(lam+fi'*P*fi);
 P=(P-K*fi'*P)/lam+R1;
 th=th+K*res; % th'

 fi(2:end)=fi(1:end-1); 
 fi(pil(1))=-y; 
 fi(pil(2))=u;

 data=[data; t y u res lam];
 datath=[datath; t th'];
 datap=[datap; t trace(P)];

 act(u);			 % Actuate control 
end

