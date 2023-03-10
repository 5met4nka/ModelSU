% 4 вар

% очистка экрана и рабочего пространства

clc;
clear;
close;

% описание схемы согласно варианта задания

R_0 = 4;
i_N = 100;
U_N = i_N * R_0;

U_VN = U_N; % 2 з-н Кирхгофа
r_V = 97.2;
i_VN = U_VN / r_V;

w = 3000; % число витков

k = 1000; % множитель для варианта 4

F_N = i_VN * w; % номинальная МДС
F = [0 1.0 1.5 2.0 2.5 3.0 3.5 4.0 5.0]' .* k; % ненормированная МДС
F_norm = F ./ F_N; % нормированная МДС

Fi_N = 0.01; % номинальный поток
Fi_norm = ([0 0.66 0.93 1.18 1.38 1.5 1.6 1.67 1.79] + 0.001)'; % нормированный магнитный поток
Fi = Fi_norm.*Fi_N; % ненормированный магнитный поток

% ---------------------------------------------------------

% нормированные величины

% уравнение невязок в матричном виде для n = 3

G3_norm = [];
G3_norm(:,1) = Fi_norm'.^0;
G3_norm(:,2) = Fi_norm'.^1;
G3_norm(:,3) = Fi_norm'.^2;
G3_norm(:,4) = Fi_norm'.^3;

C3_norm = inv(G3_norm'*G3_norm)*(G3_norm'*F_norm);
p3_norm = [C3_norm(4) C3_norm(3) C3_norm(2) C3_norm(1)];
P3_norm = polyval(p3_norm, Fi_norm); % оценивает полиномиальный p3_norm в каждой точке в Fi_norm

% функционал точности для n = 3

Jnorm3 = (F_norm-G3_norm*C3_norm)'*(F_norm-G3_norm*C3_norm)

% уравнение невязок в матричном виде для n = 5

G5_norm = [];
G5_norm(:,1) = Fi_norm'.^0;
G5_norm(:,2) = Fi_norm'.^1;
G5_norm(:,3) = Fi_norm'.^2;
G5_norm(:,4) = Fi_norm'.^3;
G5_norm(:,5) = Fi_norm'.^4;
G5_norm(:,6) = Fi_norm'.^5;

C5_norm = inv(G5_norm'*G5_norm)*(G5_norm'*F_norm);
p5_norm = [C5_norm(6) C5_norm(5) C5_norm(4) C5_norm(3) C5_norm(2) C5_norm(1)];
P5_norm = polyval(p5_norm, Fi_norm);

% функционал точности для n = 5

Jnorm5= (F_norm-G5_norm*C5_norm)'*(F_norm-G5_norm*C5_norm)

% строим правый график

subplot(1, 2, 1); % одно окно по вертикали 2 по горизонтали, работаем с 1-ым окном
plot(Fi_norm, F_norm,'b*', Fi_norm, P3_norm, 'r--', Fi_norm, P5_norm, 'g-.');
legend('F_n_o_r_m(Ф_n_o_r_m)', 'p(Ф_n_o_r_m) n=3', 'p(Ф_n_o_r_m) n=5');
title('нормированный случай');
xlabel('Ф_n_o_r_m');
ylabel('F_n_o_r_m');
grid on;

% ---------------------------------------------------------

% ненормированные величины

% уравнение невязок в матричном виде для n = 3

G3 = [];
G3(:,1) = Fi'.^0;
G3(:,2) = Fi'.^1;
G3(:,3) = Fi'.^2;
G3(:,4) = Fi'.^3;

C3 = inv(G3'*G3)*(G3'*F);
p3 = [C3(4) C3(3) C3(2) C3(1)];
P3 = polyval(p3, Fi);

% функционал точности для n = 3

Jnenorm3 = (F-G3*C3)'*(F-G3*C3)

% уравнение невязок в матричном виде для n = 5

G5 = [];
G5(:,1) = Fi' .^ 0;
G5(:,2) = Fi' .^ 1;
G5(:,3) = Fi' .^ 2;
G5(:,4) = Fi' .^ 3;
G5(:,5) = Fi' .^ 4;
G5(:,6) = Fi' .^ 5;

C5 = inv(G5'*G5)*(G5'*F);
p5 = [C5(6) C5(5) C5(4) C5(3) C5(2) C5(1)];
P5 = polyval(p5,Fi);

% функционал точности для n = 5

Jnenorm5 = (F-G5*C5)'*(F-G5*C5)

% строим левый график

subplot(1, 2, 2); % работаем с 2-ым окном
plot(Fi, F, 'b*', Fi, P3, 'r--', Fi, P5, 'g-.');
legend('F(Ф)', 'p(Ф) n=3', 'p(Ф) n=5');
title('ненормированный случай');
xlabel('Ф');
ylabel('F');
grid on;