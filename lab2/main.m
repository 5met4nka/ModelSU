% определение констант и присвоение им значений
r_V = 97.2;
r_JA = 0.05;
w = 3000;
L_JA = 0.03;
R0 = 4;
c_e = 130;
c_M = 120;
Fi_n = 0.01;
Fi_0 = Fi_n * 0.1;
J = 1.2;
w_n = 100;
i_N = 100;
M_VN = 300;
U_VN = 400; % 1 лр

global a11; a11 = 1;
global a21; a21 = c_e*Fi_0*w_n;

global a22; a22 = i_N*r_JA;
global a23; a23 = i_N*R0;

global a31; a31 = M_VN;
global a32; a32 = c_M*Fi_0*i_N;

% определение аппроксимирующего полинома
global p;
p = [0.1528 0 1.4164 0];

% u2 = const, u3 = const
u1 = 1.2: -0.2: 0.2;
u_1 = [u1; ones(size(u1)); ones(size(u1))];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u1)
    x = newton('fun_F', 'fun_G', x0, u_1(:,i), 0.0001);
    xx = [xx x];
    x0 = x;
end

%построение графиков х1(u2)
figure(1); 
plot(u1, xx(1,:)); xlabel 'Uвн', ylabel 'Фн'; grid on;
figure(2); 
plot(u1, xx(2,:)); xlabel 'Uвн', ylabel 'iгн'; grid on;
figure(3); 
plot(u1, xx(3,:)); xlabel 'Uвн', ylabel 'wн'; grid on;
figure(10);
hold on;
plot(u1, xx(1,:), u1, xx(2,:), u1, xx(3,:)); 
xlabel 'Uвн', ylabel 'Фн; iгн; wн'; grid on;
legend ('Фн', 'iгн', 'wн');
hold off;

% u1 = const, u3 = const
u2 = 1.2: -0.2: 0.2;
u_2 = [ones(size(u2)); u2; ones(size(u2))];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u2)
    x = newton('fun_F', 'fun_G', x0, u_2(:,i), 0.0001);
    xx = [xx x];
    x0 = x;
end

%построение графиков х2(u2)
figure(4);
plot(u2, xx(1,:)); xlabel 'Mвн', ylabel 'Фн'; grid on;
figure(5);
plot(u2, xx(2,:)); xlabel 'Mвн', ylabel 'iгн'; grid on;
figure(6);
plot(u2, xx(3,:)); xlabel 'Mвн', ylabel 'wн'; grid on;
figure(11);
hold on;
plot(u2, xx(1,:), u2, xx(2,:), u2, xx(3,:)); 
xlabel 'Mвн', ylabel 'Фн; iгн; wн'; grid on;
legend ('Фн', 'iгн', 'wн');
hold off;

% u1 = const и u2 = const
u3 = 1.2:-0.2:0.2;
u_3 = [ones(size(u3)); ones(size(u3)); u3];
x0 = [1; 1; 1];
xx = [];
for i = 1:length(u3)
    x = newton('fun_F', 'fun_G', x0, u_3(:,i), 0.0001);
    xx = [xx x];
    x0 = x;
end

%построение графиков х3(u2)
figure(7);
plot(u3, xx(1,:)); xlabel 'R0, Ом', ylabel 'Фн'; grid on;
figure(8);
plot(u3, xx(2,:)); xlabel 'R0, Ом', ylabel 'iгн'; grid on;
figure(9);
plot(u3, xx(3,:)); xlabel 'R0, Ом', ylabel 'wн'; grid on;
figure(12);
hold on;
plot(u3, xx(1,:), u3, xx(2,:), u3, xx(3,:)); 
xlabel 'R0, Ом', ylabel 'Фн; iгн; wн'; grid on;
legend ('Фн', 'iгн', 'wн');
hold off;