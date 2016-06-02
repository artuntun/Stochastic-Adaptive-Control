function parameters = itereatCoeffi(output, input)

parameters = [];
ye = [output(1:10)];
ue = [input(1:10)];
for i = 11:length(output)
 ye = [ye;output(i)]; 
 ue = [ue;input(i)];
 ze=[ye ue];
 Ze = dtrend(ze);
 SYS = armax(Ze, [3 1 0 1]);
 [parm p] = th2par(SYS);
 parameters = [parameters; parm'];
end