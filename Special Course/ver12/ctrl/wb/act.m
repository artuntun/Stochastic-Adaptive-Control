function act(u)
% Actuator - Implement control action

global As Bs Cs Ds Xs en

Xs=As*Xs+Bs*[u;en]; 
