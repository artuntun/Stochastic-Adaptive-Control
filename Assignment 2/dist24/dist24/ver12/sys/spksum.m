function m=spksum(m1,m2)
% Adds two spektra, m1 and m2, of different length
%
% Has to be: m=m_2z^2+m_1z^1+m_0+m_1z^{-1}+m_2z^{-2}
%

err=m1-fliplr(m1); 
if norm(err)>1e-5, disp('non symmetric spectrum'); return; end
err=m2-fliplr(m2); 
if norm(err)>1e-5, disp('non symmetric spectrum'); return; end
%[m1,k]=polclr(m1);
%[m2,k]=polclr(m2);

n1=length(m1)/2;
n2=length(m2)/2;

n=max(n1,n2);
m1=[zeros(1,n-n1) m1 zeros(1,n-n1)];
m2=[zeros(1,n-n2) m2 zeros(1,n-n2)];
m=m1+m2;




