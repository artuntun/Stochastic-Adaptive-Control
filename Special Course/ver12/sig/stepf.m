function y=stepf(ts,tz),;

%usage: y=stepf(tstop,tzero);
 
% Programmed 1994 by Niels K. Poulsen 
% Dept. of Mathematical Modelling, 
% Technical University of Denmark 

if nargin<2,
 tz=0;
 if nargin<1,
  ts=100;
  end
 end

ts=ts+1; 

y=[zeros(round(tz),1);
   ones(ts-tz,1)];

%y=zeros(ts,1);
%t1=fix(tz+0.5):ts; t1=t1(:);
%y(t1)=ones(size(t1));
