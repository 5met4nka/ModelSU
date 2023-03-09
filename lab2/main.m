% очистка экрана и рабочего пространства

clc;
clear;
close;

global r_V; r_V = 97.2;
global r_YA; r_YA = 0.05;
global w; w = 3000;
global L_YA; L_YA = 0.03;
global R_0N; R_0N = 4;
global c_e; c_e = 130;
global c_M; c_M = 120;
global J; J = 1.2;

global Fi_N; Fi_N = 0.01;
global omega_N; omega_N = 100;
global i_N; i_N = 100;
global M_VN; M_VN = 300;
global U_VN; U_VN = 400; % лр №1

global i_VN; i_VN = U_VN / r_V;
global i_GN; i_GN = i_N + i_VN;

global F_N; F_N = i_VN * w;

global p; p = [-0.0014 0.1628 -0.4707 0.4731 -0.0316 0];

% M_VN = var, R_0N = const

u1 = 1.2:-0.2:0.2;
u_1 = [u1; ones(size(u1)); ones(size(u1))];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u1)
    x = newton('fun_F', 'fun_G', x0, u_1(:,i), 0.001);
    xx = [xx x];
    x0 = x;
end

% уменьшим на 20% M_VN

u1_minus20 = 1.2 * 0.8:-0.2 * 0.8:0.2 * 0.8;
u_1_minus20 = [u1_minus20; ones(size(u1_minus20)); ones(size(u1_minus20))];
x0_minus20 = [1; 1; 1];
xx_minus20 = [];
for i = 1:length(u1_minus20)
    x_minus20 = newton('fun_F', 'fun_G', x0_minus20, u_1_minus20(:,i), 0.001);
    xx_minus20 = [xx_minus20 x_minus20];
    x0_minus20 = x_minus20;
end

% построение графиков Fi_N(M_V_N), i_GN(M_V_N), omega_N(M_V_N)

figure(1);
plot(u1, xx(1,:), 'b-', u1_minus20, xx_minus20(1,:), 'b--');
legend('Fi_N(M_V_N)', 'Fi_N(M_V_N*0.8)');
xlabel('M_V_N');
ylabel('Fi_N');
title('Зависимость Fi_N от M_V_N')
grid on;

figure(2);
plot(u1, xx(2,:), 'r-', u1_minus20, xx_minus20(2,:), 'r--');
legend('i_G_N(M_V_N)', 'i_G_N(M_V_N*0.8)');
xlabel('M_V_N');
ylabel('i_G_N');
title('Зависимость i_G_N от M_V_N')
grid on;

figure(3);
plot(u1, xx(3,:), 'g-', u1_minus20, xx_minus20(3,:), 'g--');
legend('omega_N(M_V_N)', 'omega_N(M_V_N*0.8)');
xlabel('M_V_N');
ylabel('omega_N');
title('Зависимость omega_N от M_V_N')
grid on;

figure(4);

hold on;

plot(u1, xx(1,:), 'b-', u1_minus20, xx_minus20(1,:), 'b--');
plot(u1, xx(2,:), 'r-', u1_minus20, xx_minus20(2,:), 'r--');
plot(u1, xx(3,:), 'g-', u1_minus20, xx_minus20(3,:), 'g--');
legend('Fi_N(M_V_N)', 'Fi_N(M_V_N*0.8)', 'i_G_N(M_V_N)', 'i_G_N(M_V_N*0.8)', 'omega_N(M_V_N)', 'omega_N(M_V_N*0.8)');
xlabel('M_V_N'),
ylabel('Fi_N (синий), i_G_N (красный), omega_N (зеленый)');
title('Зависимости Fi_N, i_G_N, omega_N от M_V_N')
grid on;
hold off;

% M_VN = const, R_0N = var

u2 = 1.2:-0.2:0.2;
u_2 = [ones(size(u2)); u2; ones(size(u2))];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u2)
    x = newton('fun_F', 'fun_G', x0, u_2(:,i), 0.001);
    xx = [xx x];
    x0 = x;
end

% уменьшим на 20% R_0N

u2_minus20 = 1.2 * 0.8:-0.2 * 0.8:0.2 * 0.8;
u_2_minus20 = [ones(size(u2_minus20)); u2_minus20; ones(size(u2_minus20))];
x0_minus20 = [1; 1; 1];
xx_minus20 = [];
for i = 1:length(u2_minus20)
    x_minus20 = newton('fun_F', 'fun_G', x0_minus20, u_2_minus20(:,i), 0.001);
    xx_minus20 = [xx_minus20 x_minus20];
    x0_minus20 = x_minus20;
end

% построение графиков Fi_N(R_0N), i_GN(R_0N), omega_N(R_0N)

figure(5);
plot(u2, xx(1,:), 'b-', u2_minus20, xx_minus20(1,:), 'b--');
legend('Fi_N(R_0_N)', 'Fi_N(R_0_N*0.8)');
xlabel('R_0_N');
ylabel('Fi_N');
title('Зависимость Fi_N от R_0_N')
grid on;

figure(6);
plot(u2, xx(2,:), 'r-', u2_minus20, xx_minus20(2,:), 'r--');
legend('i_G_N(R_0_N)', 'i_G_N(R_0_N*0.8)');
xlabel('R_0_N');
ylabel('i_G_N');
title('Зависимость i_G_N от R_0_N')
grid on;

figure(7);
plot(u2, xx(3,:), 'g-', u2_minus20, xx_minus20(3,:), 'g--');
legend('omega_N(R_0_N)', 'omega_N(R_0_N*0.8)');
xlabel('R_0_N');
ylabel('omega_N');
title('Зависимость omega_N от R_0_N')
grid on;

figure(8);

hold on;

plot(u2, xx(1,:), 'b-', u2_minus20, xx_minus20(1,:), 'b--');
plot(u2, xx(2,:), 'r-', u2_minus20, xx_minus20(2,:), 'r--');
plot(u2, xx(3,:), 'g-', u2_minus20, xx_minus20(3,:), 'g--');
legend('Fi_N(R_0_N)', 'Fi_N(R_0_N*0.8)', 'i_G_N(R_0_N)', 'i_G_N(R_0_N*0.8)', 'omega_N(R_0_N)', 'omega_N(R_0_N*0.8)');
xlabel('R_0_N'),
ylabel('Fi_N (синий), i_G_N (красный), omega_N (зеленый)');
title('Зависимости Fi_N, i_G_N, omega_N от R_0_N')
grid on;
hold off;