clc, clear
t=0.0:0.01:1.0;
u1 = [ones(size(t)); ones(size(t)); ones(size(t))];
x01=[0.9584;1.0434;2.7135];
x011=[0;0;0];
[y1,x1]=NSIM('fun_dF','fun_dG',t,u1,x011,'EILER');
u2 = [1*zeros(size(t));1*zeros(size(t));1*zeros(size(t))];
x02=[0.9584;1.0434;1.7135];
x012=[0;0;0];
[y2,x2]=lmsim(fun_A,fun_B,fun_C,fun_D,u2,t,x012);
figure(1)
plot(t,x1(1,:), 'k',t,x1(2,:), 'k:', t,x1(3,:), 'k--',t,x2(:,1)+x02(1),...
    'r',t,x2(:,2)+x02(2), 'r:',t,x2(:,3)+x02(3), 'r--')
grid on
title('Переходные процессы при номинальных значениях')
legend('dx1nl(t)','dx2nl(t)','dx3nl(t)','dx1l(t)','dx2l(t)','dx3l(t)')