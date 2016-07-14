confid99_in = 3*ones(length(output),1)*sqrt(Pycl_infty);
confid99_out = 3*ones(length(input),1)*sqrt(Pu_infty);

subplot(211)
plot(output)
hold on
plot(confid99_in, 'color','r')
plot(-confid99_in, 'color','r')
legend('Simulated output','Theoretical 99% confidence')
hold off
subplot(212)
plot(input)
hold on
plot(confid99_out, 'color','r')
plot(-confid99_out, 'color','r')
legend('Simulated input','Theoretical 99% confidence')
hold off