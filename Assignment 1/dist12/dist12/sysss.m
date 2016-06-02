function sys=sysss(a,b,c,d,r1,r2,x,p0)
% ---------------------------------------------------------------------------
% Usage: sys=sysss(a,b,c,d,r1,r2,x,p0)
%
%       sys=sysss(a)
%       sys=sysss(a,b)
%       sys=sysss(a,b,c)
%       sys=sysss(a,b,c,d)             Standard ss model
%       sys=sysss(a,b,c,d,r1,r2)       with process and mesurement noise
%       sys=sysss(a,b,c,d,r1,r2,x)     with initial values of state
%       sys=sysss(a,b,c,d,r1,r2,x,p0)  with additional variance
%
% ---------------------------------------------------------------------------
% Structure:
%
%   sys.A    System matrices
%   sys.B
%   sys.C
%   sys.D
%   
%   sys.nx   number of states
%   sys.ny
%   sys.nu
%   
%   sys.R1   Variance matrix of process noise
%   sys.R2   Variance matrix of measurement noise
%   
%   sys.X0   Initial (mean of) state
%   sys.P0   Initial variance matrix for state vector
%   
%   sys.sim  Simulations data
% ---------------------------------------------------------------------------
%   sys.sim.X   Actual state vector
%   sys.sim.S1  Scaling matrix for process noise
%   sys.sim.S2  Scaling matrix for measurement noise
%   sys.sim.nv  number of elements in process noise
%   sys.sim.ne  number of elements in measurement noise 
%   
% ---------------------------------------------------------------------------

ng=nargin;

sys.A=a;
sys.nx=size(a,1);
sys.sim.X=zeros(sys.nx,1);
if ng<2, return; end;

sys.B=b;
sys.nu=size(b,2);
if ng<3, return; end;

sys.C=c;
sys.ny=size(c,1);
if ng<4, d=zeros(ny,nu); end;
sys.D=d;
if ng<5, return; end;
% ---------------------------------------------------------------------------
% End of standard state space description.
% ---------------------------------------------------------------------------
sys.R1=r1;
sys.sim.S1=spred(r1);
sys.sim.nv=size(sys.sim.S1,2);
if ng<6, return; end;

sys.R2=r2;
sys.sim.S2=spred(r2);
sys.sim.ne=size(sys.sim.S2,2);
if ng<7, return; end;

if ~isempty(x), sys.sim.X=x; else, sys.sim.X=zeros(sys.nx,1); end;
sys.X0=sys.sim.X;
if ng<8, return; end;

sys.P0=p0;
S0=spred(p0);
sys.sim.X=sys.sim.X+S0*randn(sys.nx,1);
% ---------------------------------------------------------------------------

function s=spred(p)
%Usage:  s=spred(p)
%
% Determine s such:
%
% p=s*s'

[v,d]=eig(p);
s=v*diag(sqrt(diag(d)));
