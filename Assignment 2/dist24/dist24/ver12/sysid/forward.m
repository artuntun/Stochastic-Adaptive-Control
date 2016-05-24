function th=forward(Ze)
% Usage:  th=forward(Ze)

%------------------------------------------------------------------
% Some input administration
if nargin<3,
 Zt=[];
 mode=0;
elseif nargin<4
 mode=0;
end
%------------------------------------------------------------------
N=length(Ze);
%------------------------------------------------------------------
niveaua=0.99;	% Niveau ved forward
niveaub=0.9; 	% Niveau ved backward
str=5; % L-structure (5), ARMAX(3)
ns=[0 1 0 0 0 1]; 
%-----------------------------------------------------------------
np=sum(ns(1:end-1));
[th,loss]=pemest(Ze,ns); 			% initial model
nspor=ns; 			% track search directions
fprintf('%i %i %i %i %i %i \n',ns)
%-----------------------------------------------------------------
% Forward selection
prob=1;
while prob>niveaua,
 lossn=[]; nsn=[];
 for i=1:str,
  nst=ns; nst(i)=nst(i)+1;
  nsn=[nsn; nst]; 
  fprintf('%i %i %i %i %i %i \r',nst)
  [th,tabs]=pemest(Ze,nst);
  lossn=[lossn; tabs];
 end
 fprintf('\n');
 [loss1,idx]=min(lossn);
 ns1=nsn(idx,:);
 np1=sum(ns1(1:end-1));
 dloss=(loss-loss1)/loss1;
 dp=(N-np1)/(np1-np);
 ftest=dloss*dp;
 prob=pf(ftest,np1-np,N-np1);
 if prob>niveaua,
  loss=loss1;
  np=np1;
  ns=ns1;
  fprintf('%i %i %i %i %i %i \n',ns)
  nspor=[nspor; ns];
 end;
end
%-----------------------------------------------------------------
% and a step backwards
prob=0;
while prob<niveaub,
 lossn=[]; nsn=[];
 for i=1:str,
  nst=ns; nst(i)=max(nst(i)-1,0);
  if norm(nst-ns)>0,
   nsn=[nsn; nst];
   [th,tabs]=pemest(Ze,nst);
   lossn=[lossn; tabs];
  end
 end
 [loss1,idx]=min(lossn);
 ns1=nsn(idx,:);
 np1=sum(ns1(1:end-1));
 dloss=(loss1-loss)/loss;
 dp=(N-np)/(np-np1);
 ftest=dloss*dp;
 prob=pf(ftest,np-np1,N-np);
 if prob<niveaub,
  loss=loss1;
  np=np1;
  ns=ns1;
  disp(ns)
  nspor=[nspor; ns];
 end;
end
%-----------------------------------------------------------------
% Final model
[th,loss]=pemest(Ze,ns);
pshow(th);
disp(th.EstimationInfo.LossFcn);
%res=pe(Ze,th);
%for i=1:size(nspor,1),
% fprintf('%2i %2i %2i %2i %2i %2i \n',nspor(i,:))
%end
