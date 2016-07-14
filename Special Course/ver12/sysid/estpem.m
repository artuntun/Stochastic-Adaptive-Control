function [th,loss]=pemest(z,ns);
if ns(2)>0,
 th=pem(z,ns);
 loss=th.EstimationInfo.LossFcn;
else, % nb=0
 if ns(3)>0,
  ns=[ns(1)+ns(4) ns(3)];
  z=z(:,1);
  th=armax(z,ns);
  loss=th.EstimationInfo.LossFcn;
 else
  na=ns(1)+ns(4);
  z=z(:,1);
  th=ar(z,na);
  loss=th.EstimationInfo.LossFcn;
 end
end
