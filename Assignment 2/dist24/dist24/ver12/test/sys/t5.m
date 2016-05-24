task=1;
fprintf('Test of syslyap \n');

%a=0.98;
%r1=1;

a=[-1.5 1;-0.7 0];
r1=eye(2);

if task==1, % Check for correctness
 syslyap(a,r1,1,0)
 dlyap(a,r1)
elseif task==2, % check for speed
 % for i=1:10, t5; end;
 tic
 syslyap(a,r1,1,0);
 toc
 tic
 dlyap(a,r1);
 toc
end
