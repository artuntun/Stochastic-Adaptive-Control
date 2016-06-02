function [y,t]=meas(sysflag)  

global t Ts;
global thS fiS pilS se % D-time Linear model
global datath0

% --------------------------------------------------------------------------
%thS(3)=1+sin(2*pi*t/500)*0.5;
%if t> 50 thS(3)=-1; end;
datath0=[datath0; t thS'];
% --------------------------------------------------------------------------
e=randn*se;
fiS(pilS(3))=e;
y=thS'*fiS;

fiS(2:end)=fiS(1:end-1);
fiS(pilS(1))=-y;

t=t+Ts;
