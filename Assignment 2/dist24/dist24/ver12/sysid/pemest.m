function [th,loss]=pemest(z,ns);
if ns(2)>0,
 th=pem(z,ns);
 res=pe(z,th);
else, % No B coefficient in model
 if ns(3)>0, % ARMA model
  narma=[ns(1)+ns(4) ns(3)];
  zt=z(:,1);
  th=armax(zt,narma)
  res=pe(zt,th);
 else        % AR model
  na=ns(1)+ns(4);
  zt=z(:,1);
  th=ar(zt,na)
  res=pe(zt,th);
 end
end
loss=sum(res.^2)/length(res);
