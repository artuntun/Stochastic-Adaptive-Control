function [nstruc,le,lt]=sfind(nmax,Ze,Zt,mode)
%function [fskema,le,lt]=sfind(nmax,Ze,Zt,mode)
%Usage: [fskema,le,lt]=sfind(nmax,Ze,Zt,mode)
%
%Input:
%
% nmax:		Maximal order
% Ze:		Estimation data set
% Zt:		Validation (test) data set
% mode:		Mode for printing 
%                (0) Nothing is printed, 
%                (1) Just the order is printed
%                (2) estimation results are printed
%
%Output:
%
% nstruc:  F-test table
% le:      loss function for estimation data
% lt:      loss function for test data (if exists)

%------------------------------------------------------------------
% Some input administration
if nargin<3,
 Zt=[];
 mode=0;
elseif nargin<4
 mode=0;
end
N=length(Ze);
%------------------------------------------------------------------
% -- Determine models --
nstruc=[]; le=[]; lt=[];
for ia=1:nmax,
 for ib=1:nmax+1,
  for ic=1:nmax,
   ns=[ia ib ic 0 0 1];
   disp(ns)
   nstruc=[nstruc; ns];
   th=pem(Ze,ns); 
   res=pe(Ze,th);
   tabe=res'*res/length(res);
   le=[le; tabe];
   if ~isempty(Zt),
    res=pe(Zt,th);
    tabt=res'*res/length(res);
    lt=[lt; tabt];
   end % test data set
  end % ic
 end % ib
end % ia
%------------------------------------------------------------------
clc;
disp('Estimations data')
disp('    Loss               structure ')
lle=[]; ns=[];
np=sum(nstruc(:,1:3)')';
plot(np,le,'+'); grid; title('Loss - Estimation set')
xlabel('# of parm');
for i=min(np):max(np),
 idx=find(i==np);
 tns=nstruc(idx,:); tle=le(idx);
 [loss,pil]=min(tle);
 lle=[lle; loss]; ns=[ns; tns(pil,:)];
 disp([loss tns(pil,:)])
end
np=min(np):max(np); np=np(:);
hold on
plot(np,lle,'-');
hold off
% print losse.pps
loss=[lle np]; % and ns contain information to be used later
pause
%------------------------------------------------------------------
if ~isempty(Zt),
 clc;
 disp('Test data')
 disp('    Loss               structure ')
 llt=[]; nst=[];
 np=sum(nstruc(:,1:3)')';
 plot(np,lt,'+'); grid; title('Loss - Test data');
 xlabel('# of parms');
 for i=min(np):max(np),
  idx=find(i==np);
  tns=nstruc(idx,:); tlt=lt(idx);
  [loss,pil]=min(tlt);
  llt=[llt; loss]; 
  disp([loss tns(pil,:)]);
 end
 np=min(np):max(np); np=np(:);
 hold on
 plot(np,llt,'-');
 hold off
 % print losst.pps
 pause
 loss=[lle llt np]; % and ns contain information to be used later
end
%------------------------------------------------------------------

clc;
if isempty(Zt),
 disp('      Diff      Loss     #parm')
 disp([[NaN; diff(loss(:,1))] loss])
 plot(loss(:,1),'*-'); grid; title('Loss function'); xlabel('model no.');
else
 disp('      Diff                Loss               #parm')
 disp([[NaN NaN; diff(loss(:,1:2))] loss])
 plot(loss(:,1:end-1),'*-'); 
 legend('Est.','Test',0);
 grid; title('Loss function'); xlabel('model no.');
end
% print loss.pps
disp('hit it'); pause

%------------------------------------------------------------------
% -- Ftest --
n=length(loss);
fskema=zeros(n-1,n-1);
n=length(loss);
lossA=loss(1:end-1,1); npA=loss(1:end-1,end);
lossB=loss(2:end,1);   npB=loss(2:end,end);
for i=1:n-1,
 for j=i:n-1,
  dloss=(lossA(i)-lossB(j))/lossB(j);
  dpar=(N-npB(j))/(npB(j)-npA(i));
  ftest=dloss*dpar;
  if ftest>0,
   fskema(i,j)=round(fcdf(ftest,npB(j)-npA(i),N-npB(j))*100);
   %fskema(i,j)=round(pf(ftest,npB(j)-npA(i),N-npB(j))*100);
   %disp([lossA(i) lossB(j) npA(i) npB(j) round(pf(ftest,npB(j)-npA(i),N-npB(j))*100)])
   %pause
  end
 end;
end;

clc;
disp('Models'); disp(' ');
disp([np ns]);
disp('hit it'); pause;
disp(' ')
disp('F test');
disp(' ')
disp([ NaN np(2:end)'; np(1:end-1) fskema]);
disp(' ')

%------------------------------------------------------------------
% -- Aic, Bic FPE --

np=loss(:,end); loss=loss(:,1);
ic=zeros(n,3);
for i=1:n,
 ic(i,1)=(1+2*np(i)/N)*loss(i);       % AIC
 ic(i,2)=(1+log(N)*np(i)/N)*loss(i);  % BIC
 ic(i,3)=(N+np(i))*loss(i)/(N-np(i)); % FPE 
end

disp(' ')
plot(np,ic,'*-'); grid;
title('AIC, BIC, FPE'); xlabel('model no.');
[mi,im]=min(ic);
disp(' '); disp('AIC BIC FPE'); disp(' ');
disp(np(im)')
% print aic.pps

