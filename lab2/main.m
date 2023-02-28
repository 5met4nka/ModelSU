% очистка экрана и рабочего пространства

clc;
clear;
close;

global r_V; r_V = 97.2;
global r_YA; r_YA = 0.05;
global w; w = 3000;
global L_YA; L_YA = 0.03;
global R_0; R_0 = 4;
global c_e; c_e = 130;
global c_M; c_M = 120;
global J; J = 1.2;

global Fi_N; Fi_N = 0.01;
global omega_N; omega_N = 100;
global i_N; i_N = 100;
global M_VN; M_VN = 300;
global U_VN; U_VN = 400; % лр №1

global i_VN; i_VN = U_VN / r_V;
global i_GN; i_GN = i_N + i_VN

global p; p = [-0.0014 0.1628 -0.4707 0.4731 -0.0316 0];

% u1 = var, u2 = const
u1 = 0.2:0.02:1.2;
u_1 = [u1; ones(size(u1)); ones(size(u1))];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u1)
    x = newton('fun_F', 'fun_G', x0, u_1(:,i), 0.0001);
    xx = [xx x];
    x0 = x;
end

%построение графиков х1(u1), х2(u1), х3(u1)
figure(1);
plot(u1, xx(1,:));
xlabel('M_В');
ylabel('Ф_н');
grid on;

figure(2);
plot(u1, xx(2,:));
xlabel('M_В');
ylabel('i_гн');
grid on;

figure(3);
plot(u1, xx(3,:)); xlabel('M_В'),
ylabel('w_н');
grid on;

figure(4);
hold on;
plot(u1, xx(1,:), u1, xx(2,:), u1, xx(3,:)); 
xlabel('M_В');
ylabel('Ф_н; i_гн; w_н');
grid on;
legend('Ф_н', 'i_гн', 'w_н');
hold off;

% u1 = const, u2 = var
u2 = 0.2:0.02:1.2;
u_2 = [ones(size(u2)); u2; ones(size(u2))];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u2)
    x = newton('fun_F', 'fun_G', x0, u_2(:,i), 0.0001);
    xx = [xx x];
    x0 = x;
end

%построение графиков х1(u2), х2(u2), х3(u2)
figure(5);
plot(u2, xx(1,:));
xlabel('R_0');
ylabel('Ф_н');
grid on;

figure(6);
plot(u2, xx(2,:));
xlabel('R_0');
ylabel('i_гн');
grid on;

figure(7);
plot(u2, xx(3,:));
xlabel('R_0');
ylabel('w_н');
grid on;

figure(8);
hold on;
plot(u2, xx(1,:), u2, xx(2,:), u2, xx(3,:)); 
xlabel('Mвн');
ylabel('Ф_н; i_гн; w_н');
grid on;
legend('Ф_н', 'i_гн', 'w_н');
hold off;