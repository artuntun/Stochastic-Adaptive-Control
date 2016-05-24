function [covf,corf]=estacf(y,m,meancorr)
% Usage: [covf,corf]=estacf(y,m,meancorr)
%        covf=estacf(y,m,meancorr)
%
% covf : (Auto) Coravariance Function
% corf : (Auto) Correlation Function
% y    : data sequence
% m    : length of functions
% meancorr : if exist and positive data is ajusted for non zero mean

% Home: sysid
% Testfile: t1

n=length(y);

if nargin<2, 
 m=10; meancorr=0; 
elseif nargin<3,
 meancorr=0;
end;
if isempty(m), m=10;  end;

if meancorr>0,
 y=y-sum(y)/n;
end

r=zeros(m,1);
for i=1:m,
 t=i-1;
 r(i)=y(1:end-t)'*y(i:end)/(n-t);
end

if nargout>0,
 covf=r; corf=r/r(1);
end

if nargout==0, % Here we go plotting
 covf=r; corf=r/r(1);
 idx=0:m-1;
 bar(idx,corf); grid;
 aks=axis; axis([0 m aks(3:4)]);
 hold on
 frac=2.5758;
 limit=frac/sqrt(length(y));
 plot([1 m-1],[limit limit]);
 plot([1 m-1],[-limit -limit]);
 hold off
 tc=length(y)*sum(covf(2:end).^2)
 if exist('pchisq'),
  (1-pchisq(tc,m-1))*100
 end
 if exist('chi2cdf'),
  (1-chi2cdf(tc,m-1))*100
 end
end
