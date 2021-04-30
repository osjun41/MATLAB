x = 0:0.1:2*pi;
y = sin(x);
plot(x,y,'r')
xlabel('x')
ylabel('sin(x)')
title('Plot of the Sine Function')

hold on

y2 = cos(x);
plot(x,y2,'g--')
legend('sin','cos')

hold off
