alf=[-0.1 0.1 0.9];
for i=1:length(alf),
 c=1;
 a=[1 -alf(i)];
 s2=0.5;
 %c=[1 0.6];
 %a=[1 -0.6 0.8];
 %a=[1 -1.6 0.8];
 
 [a_spec,c_spec]=spec(a,c);
 [a_sd,c_sd]=spec2sd(a_spec,c_spec);
 specplt(a_sd,c_sd);
 pause
end
