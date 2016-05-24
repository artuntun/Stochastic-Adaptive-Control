function [yt,ut]=clsim(a,b,k,c,t,r,s,et,wt)
%usage [yt,ut]=clsim(a,b,k,c,q,r,s,et,wt)
 
% Programmed 1994 by Niels K. Poulsen 
% Department of Mathematical Modelling, 
% Technical University of Denmark 
 
 
[ac,bc,kc]=clloop(a,b,k,c,r,s,t,1);
bc=poldel(bc,kc);
ywt=filter(bc,ac,wt);
[ac,bc,kc]=clloop(a,b,k,c,r,s,t,2);
yet=filter(bc,ac,et);
yt=ywt+yet;
[ac,bc,kc]=clloop(a,b,k,c,r,s,t,3);
bc=poldel(bc,kc);
uwt=filter(bc,ac,wt);
[ac,bc,kc]=clloop(a,b,k,c,r,s,t,4);
uet=filter(bc,ac,et);
ut=uwt+uet;
end
