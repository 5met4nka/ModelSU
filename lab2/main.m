% определение констант и присвоение им значений
rw = 97.2;
rja = 0.05;
w = 3000;
ce = 130;
cm = 120;
R0b = 0; % ~~~~~~~~~~~~
Fib = 0.01;
Wb = 100;
igb = 100;
Mvb = 300;
Uvb = 0; % ~~~~~~~~~~~~

global a11; a11 = 1;
global a21; a21 = ce*Fib*Wb;

global a22; a22 = igb*rja;
global a23; a23 = igb*R0b;

global a31; a31 = Mvb;
global a32; a32 = cm*Fib*igb;

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