function [pacrf,pacvf]=estpacf(y,m,meancorr)

% Usage: [pacrf,pacvf]=estpacf(y,m,meancorr)
%
% pacrf : estimate of partial auto correlation function
% pacvf : estimate of partial auto covariance function
% y     : data sequence
% m     : length of functions
% meancorr : if exist and positive data is ajusted for non zero mean

% Home: sysid
% Testfile: t2.m

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

pacrf=1;
for i=1:m,
 th=estar(y,i);
 pacrf=[pacrf -th(end)];
end
s2=var(y);
pacvf=s2*pacrf;

if nargout==0, % Here we go plotting
 idx=0:m;
 bar(idx,pacrf); grid;
 aks=axis; axis([0 m+1 aks(3:4)]);
 hold on
 frac=2.5758;
 limit=frac/sqrt(length(y));
 plot([0.5 m+0.5],[limit limit]);
 plot([0.5 m+0.5],[-limit -limit]);
 hold off
 tc=length(y)*sum(pacrf(2:end).^2)
 if exist('pchisq'),
  (1-pchisq(tc,m-1))*100
 end
 if exist('chi2cdf'),
  (1-chi2cdf(tc,m-1))*100
 end
end

