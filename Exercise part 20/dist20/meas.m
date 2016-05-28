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
 h=[sum(Xs); Xs(1)];
 h=h+Dn2*randn(n2(2),1);
 t=Tnext;
 Tnext=Tnext+Ts;
end
