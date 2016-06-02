function act(u,sysflag)
% Actuator - Implement control action

global thS fiS pilS    % D-time Linear model

fiS(pilS(2))=u;
