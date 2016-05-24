function act(u,sysflag)
% Actuator - Implement control action

global t Tnext Ts
global Xs

if sysflag==0, 		% Physical system (D/A converter)
 da_u1([u 0]*0.01);
elseif sysflag==1, 	% Linear discrete time system
 Xs=nl2tank(Xs,u);
elseif sysflag==2, 	% Linear Continoues time system
 [td,xd]=ode45('dl2tank',[0 Ts],Xs,[],u);
 Xs=xd(length(xd),:)';
elseif sysflag==3,	% Nonlinear continoues time system
 [td,xd]=ode45('d2tank',[0 Ts],Xs,[],u);
 Xs=xd(length(xd),:)';
end


