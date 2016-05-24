format compact

if strcmp(computer,'GLNX86'),
 path(path,'/home/nkp/toolbox/ver12/ctrl')
 path(path,'/home/nkp/toolbox/ver12/sys')
 path(path,'/home/nkp/toolbox/ver12/pol')
 path(path,'/home/nkp/toolbox/ver12/vec')
elseif strcmp(computer,'HPUX'),
 path(path,'/home2/nkp/toolbox/ver12/ctrl')
 path(path,'/home2/nkp/toolbox/ver12/sys')
 path(path,'/home2/nkp/toolbox/ver12/pol')
 path(path,'/home2/nkp/toolbox/ver12/vec')
end
