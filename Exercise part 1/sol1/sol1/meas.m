function h=meas(sysflag)  
% Measureing levels in tank system

global Xs			% State in simulation
global t Ts Tnext;		% Time managers

% ---- Physical A/D converter ------------------------------------
if sysflag==0,			% Physical A/D converter
 timer=[0 0 0 3600 60 1]';
 t=clock*timer;
 while t<Tnext, t=clock*timer; end;
 Tnext=Tnext+Ts;
 [level,stat]=ad_mm1;
 h=level;
% ---- Simulation ------------------------------------------------
elseif sysflag>0, 		
 h=[sum(Xs); Xs(1)];
 t=Tnext;
 Tnext=Tnext+Ts;
end
% ----------------------------------------------------------------
