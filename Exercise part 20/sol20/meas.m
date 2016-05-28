function h=meas(sysflag)  
% Measureing level in tank system

global Xs 
global Cs Ds en
global t Ts Tnext;
global Cn2 Dn2 Xn2 n2
global en

if sysflag==0,			% Physical A/D converter
 timer=[0 0 0 3600 60 1]';
 t=clock*timer;
 while t<Tnext, t=clock*timer; end;
 Tnext=Tnext+Ts;
 [level,stat]=ad_mm1;
 h=level;
elseif sysflag>0, 		% Simulation 
 if sysflag==4,% test system
  en=randn;
  y=Cs*Xs+Ds*[0;en];
  h=[0;y]; 
 elseif sysflag==5, % Test system 2
  en=randn;
  y=Cs*Xs+Dn2*en;
  h=[0;y];
 else
  h=[sum(Xs); Xs(1)];
  h=h+Dn2*randn(n2(2),1);
  %h=h+Cn2*Xn2+Dn2*randn(n2(2),1);
 end
 t=Tnext;
 Tnext=Tnext+Ts;
end
