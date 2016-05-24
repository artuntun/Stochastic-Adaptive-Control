function y=randch(ns,p)
%Usage y=randch(ns,p)
%
% ns: length of sequence
% p:  change probability

ip=1-p;
y=zeros(ns,1);
e=rand(ns,1);
idx=find(e>ip);
nch=length(idx);
y(idx)=randn(nch,1);

