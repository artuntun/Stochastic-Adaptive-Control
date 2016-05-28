disp('Velcome to 02421')
format compact
warning off
if strcmp(computer,'GLNX86'),
 disp('Linux environment')
 path('.',path);
 path(path,'/home/nkp/matlab/ctrl');
 path('/home/nkp/matlab/pol',path);
 path('/home/nkp/matlab/vec',path);
 path('/home/nkp/matlab/sys',path);
 path('/home/nkp/matlab/sig',path);
 path('/home/nkp/matlab/plt',path);
 path(path,'/home/nkp/matlab/sysid');
 path('/home/nkp/matlab/stixbox',path);
 path('/home/nkp/gpc/mlab/util',path);
 path('/home/nkp/gpc/mlab/sim/priv',path);
else 
 path(path,'/home2/nkp/matlab/ctrl');
 path('/home2/nkp/matlab/pol',path);
 path('/home2/nkp/matlab/vec',path);
 path('/home2/nkp/matlab/sys',path);
 path('/home2/nkp/matlab/sig',path);
 path('/home2/nkp/matlab/plt',path);
 path(path,'/home2/nkp/matlab/sysid');
 path('/home2/nkp/matlab/stixbox',path);
 path('/home2/nkp/gpc/mlab/util',path);
 path('/home2/nkp/gpc/mlab/sim/priv',path);
end

