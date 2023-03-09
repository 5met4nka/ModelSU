clc, clear
t = 0:0.01:1;
u = [ones(size(t)); ones(size(t)); ones(size(t))];
x0 = [0;0;0];
[y,x] = nsim('fun_F', 'fun_G', t, u, x0, 'eiler');
plot(t,x(1,:), 'k--', t, x(2,:), 'k', t, x(3,:), 'k:');
grid on;
title('График при номинальных значениях');
legend('x_1(t)', 'x_2(t)', 'x_3(t)');


clc, clear
t=0:0.01:1;
u=[ones(size(t)); ones(size(t)); ones(size(t))];
x0=[0;0;0];
[y,x]=nsim('fun_F', 'fun_G', t, u, x0, 'eiler');
plot(t,y(1,:),'k--',t,y(2,:),'k');
grid on;
title('График при номинальных значениях');
legend('y_1(t)', 'y_2(t)');


clc, clear
t= 0:0.01:1;
u=[ones(size(t)); ones(size(t)); ones(size(t))];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(x(2,:),x(3,:),'k');
grid on;
title('Фазовый портрет при номинальных значениях');
legend('x_3(x_2)');


clc, clear
t=0:0.01:1;
u=[ones(size(t)); ones(size(t)); ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(t,x(1,:),'k--',t,x(2,:),'k',t,x(3,:),'k:'), grid on
title('График при уменьшенном U_c на 20%')
legend('x_1(t)','x_2(t)','x_3(t)')


clc, clear
t=0:0.01:1;
u=[ones(size(t));ones(size(t));ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(t,y(1,:),'k--',t,y(2,:),'k'), grid on
title('График при уменьшенном U_c на 20%')
legend('y_1(t)','y_2(t)')


clc, clear
t=0:0.01:1;
u=[ones(size(t));ones(size(t));ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(x(2,:),x(3,:),'k'), grid on
title('Фазовый портрет при уменьшенном U_c на 20%')
legend('x_3(x_2)')


clc, clear
t=0:0.01:1;
u=[ones(size(t));ones(size(t))*0.85;ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(t,x(1,:),'k--',t,x(2,:),'k',t,x(3,:),'k:'), grid on
title('График при уменьшенном M_в на 15%, U_c на 20%')
legend('x_1(t)','x_2(t)','x_3(t)')


clc, clear
t=0:0.01:1;
u=[ones(size(t));ones(size(t))*0.85;ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(t,y(1,:),'k--',t,y(2,:),'k'), grid on
title('График при уменьшенном M_в на 15%, U_c на 20%')
legend('y_1(t)','y_2(t)')


clc, clear
t=0:0.01:1;
u=[ones(size(t));ones(size(t))*0.85;ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(x(2,:),x(3,:),'k'), grid on
title('Фазовый портрет при уменьшенном M_в на 15%, U_c на 20%')
legend('x_3(x_2)')


clc, clear
t=0:0.01:1;
u=[ones(size(t))*0.8;ones(size(t))*0.85;ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(t,x(1,:),'k--',t,x(2,:),'k',t,x(3,:),'k:'), grid on
title('График при уменьшенном M_в на 15%, U_c на 20%, U_в на 20%')
legend('x_1(t)','x_2(t)','x_3(t)')


clc, clear
t=0:0.01:1;
u=[ones(size(t))*0.8;ones(size(t))*0.85;ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(t,y(1,:),'k--',t,y(2,:),'k'), grid on
title('График при уменьшенном M_в на 15%, U_c на 20%, U_в на 20%')
legend('y_1(t)','y_2(t)')


clc, clear
t=0:0.01:1;
u=[ones(size(t))*0.8;ones(size(t))*0.85;ones(size(t))*0.8];
x0=[0;0;0];
[y,x]=nsim('fun_F','fun_G',t,u,x0,'eiler');
plot(x(2,:),x(3,:),'k'), grid on
title('Фазовый портрет при уменьшенном M_в на 15%, U_c на 20%, U_в на 20%')
legend('x_3(x_2)')