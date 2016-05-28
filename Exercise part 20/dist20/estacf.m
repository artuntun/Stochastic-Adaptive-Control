function [covf,corf,tc,prbc]=estacf(y,m,meancorr,mth,mon)
% Usage: [covf,corf]=estacf(y,m,meancorr)
%        covf=estacf(y,m,meancorr)
%
% covf : (Auto) Coravariance Function
% corf : (Auto) Correlation Function
% tc   : Test quantity (for whiteness)
% prbc : Testprobability
%
% y    : data sequence
% m    : length of functions
% meancorr : if exist and positive data is ajusted for non zero mean
% mth:     : Method used direct (1) or FFT based (2)
% mon:     : Monitor on (1) or off (0)

% Home: sysid
% Testfile: t1

% -----------------------------------------------------------------------
if nargin<2, m=10; end;
if nargin<3, meancorr=0; end;
if nargin<4, mth=1; end;
if nargin<5, mon=0; end;
if isempty(m), m=10;  end;
if isempty(meancorr), meancorr=0; end;
% -----------------------------------------------------------------------
n=length(y);
if meancorr>0,
 y=y-sum(y)/n;
end
% ------------------------------------------------------------------------
switch mth,
 case 1, 
  r=t_acf(y,m,n,mon);
 case 2, 
  r=f_acf(y,m,n,mon);
 otherwise
  fprintf('mth out of range \n');
end;
% ------------------------------------------------------------------------

covf=r; corf=r/r(1);
tc=length(y)*sum(corf(2:end).^2);

if exist('pchisq'),
 prbc=(1-pchisq(tc,m-1));
elseif exist('chi2cdf'),
 prbc=(1-chi2cdf(tc,m-1));
end

% ------------------------------------------------------------------------
%Ploting for testing of whitenes.
% ------------------------------------------------------------------------
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
 fprintf('Test quantity: %8.4g \n',tc);
 fprintf('Test prob:  %8.1f \n',prbc*100);
end

% ------------------------------------------------------------------------
function r=t_acf(y,m,n,mon)
% ------------------------------------------------------------------------
% Direct estimation of the ACF function
% ------------------------------------------------------------------------
if mon==1, disp('Direct method'); end;
r=[];
for i=1:m,
 t=i-1;
 r=[r; sum(y(1:end-t).*y(i:end))/(n-t)];
end

% ------------------------------------------------------------------------
function r=f_acf(y,m,n,mon)
% ------------------------------------------------------------------------
% Estimation of the ACF function using FFT
% ------------------------------------------------------------------------
if mon==1, disp('FFT method'); end;
F=fft(y);
fi=abs(F).^2; % spectral density
R=ifft(fi)/n;
r=R(1:m);
