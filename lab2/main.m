clc;
clear;
close;
% определение констант и присвоение их значений
eps = 0.01;
% определение аппроксимирующего полинома
p = [0.0652531464530903 0 -0.417793814270038 0 1.24716103354177 0];
% формирование набора значений вектора входов при постоянных значениях
% первой и третьей координат
u1 = 2 : -0.01 : 0.1;
u2 = 1;
u3 = 1;
Ones = ones(1, length(u1));
u = [u1; u2*Ones; u3*Ones];
% задание начальных значений вектора х, номинальный режим
x0 = [1; 1; 2];
% цикл расчёта значений вектора х
xx = [];
for i = 1:length(u1)
    x = newton('fun_F','fun_G',x0,u(:,i),0.001)
    xx = [xx x];
    x0 = x;
end
% построение графиков
subplot(3,3,1);
plot(u1,xx(1,:));
xlabel('Uв');
ylabel('Ф(Uв)');
subplot(3,3,2);
plot(u1,xx(2,:),'--');
xlabel('Uв');
ylabel('iг(Uв)');
subplot(3,3,3);
plot(u1,xx(3,:),'-.');
xlabel('Uв');
ylabel('\omega(Uв)');
drawnow

u1 = 1;
u2 = 2 : -0.01: 0.1;
u3 = 1;
Ones = ones(1, length(u2));
u = [u1*Ones; u2; u3*Ones];
% задание начальных значений вектора х, номинальный режим
x0 = [1; 1; 2];
% цикл расчёта значений вектора х
x = [];
xx = [];
for i = 1:length(u2)
    x = newton('fun_F','fun_G',x0,u(:,i),eps)
    xx = [xx x];
    x0 = x;
end
subplot(3,3,4);
plot(u2,xx(1,:));
xlabel('Mв');
ylabel('Ф(Mв)');
subplot(3,3,5);
plot(u2,xx(2,:),'--');
xlabel('Mв');
ylabel('iг(Mв)');
subplot(3,3,6);
plot(u2,xx(3,:),'-.');
xlabel('Mв');
ylabel('\omega(Mв)');
drawnow

u1 = 1;
u2 = 1;
u3 = 4 : -0.1 : 0.1;
Ones = ones(1, length(u3));
u = [u1*Ones; u2*Ones; u3];
% задание начальных значений вектора х, номинальный режим
x0 = [1; 1; 2];
% цикл расчёта значений вектора х
x = [];
xx = [];
for i = 1:length(u3)
    x = newton('fun_F','fun_G',x0,u(:,i),eps)
    xx = [xx x];
    x0 = x;
end
subplot(3,3,7);
plot(u3,xx(1,:));
xlabel('R0');
ylabel('Ф(R0)');
subplot(3,3,8);
plot(u3,xx(2,:),'--');
xlabel('R0');
ylabel('iг(R0)');
subplot(3,3,9);
plot(u3,xx(3,:),'-.');
xlabel('R0');
ylabel('\omega(R0)');