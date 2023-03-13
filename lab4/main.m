global flow i W
i = 1.151; flow = 2.172; W = 1.586;
global A B C D t

%Дано:
rv=97.2; % Сопротивление обмотки возбуждения, Ом
rya=0.05; % Сопротивление якоря, Ом
w=3000; % Число витков обмотки возбуждения
R0=4; % Сопротивление нагрузки, Ом
ce=130; cm=120; % Конструктивный коэффициент
Flow_n=0.01; % Номинальный магнитный поток, Вб
w_n=100; % Номинальная угловая скорость, с^-1
in=100; % Номинальный ток якоря, А
Mvn=300; % Номинальный момент, Н*м
J = 1.2; % Момент инерции, кг*м^2
Lya = 0.03;%Индуктивность обмотки якоря, Гн
p_5=[-0.0014 0.1621 -0.4051 0.3404 0.0503 0.0012];%Полином 5-й степени
eps=0.001; %Ошибка шаг
%Расчёт коэффициентов 
factor=w*in*R0/rv;
ig=Mvn/(cm*Flow_n);
a1=ig*R0;
a2=factor*R0/w;
a3=factor*rv/w;
a4=ce*w_n*Flow_n;
a5=ig*rya;
a6=Mvn;
a7=cm*Flow_n*ig;
a8=factor/w;
a11=1/(Flow_n*w);
a22=1/(Lya*ig);
a33=1/(J*w_n);

%Матрицы
A = [(-a11*a2*1-a11*a3)*polyval(polyder(p_5),flow), a11*a1*1, 0;
    a22*a4*W+a22*a2*polyval(polyder(p_5),flow)*1, -a22*a5-a22*a1*1, a22*a4*flow;
    -a33*a7*i, -a33*a7*flow, 0];
B = [0 a11*a1*i-a11*a2*polyval(p_5,flow);
    0 a22*a1*i+a22*a2*polyval(p_5, flow);
    a33*a6 0];
C = [a8*polyval(polyder(p_5), flow), 0, 0;
    polyval(polyder(p_5), flow), 0, 0];
D = [0, 0; 0, 0];
simulate();
XP = poly(A);
disp(XP);
Imd = roots(XP);
figure('color','white')
plot(real(Imd), imag(Imd), '*k'), grid on
xlabel('Re'), ylabel('Im');
t=0:eps:10;