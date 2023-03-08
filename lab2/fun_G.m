% вычисление значений матрицы частных производных G(x, u)
function g = fun_G(x,u)

    global r_V;
    global r_YA;
    global w;
    global L_YA;
    global R_0N;
    global c_e;
    global c_M;
    global J;

    global Fi_N;
    global omega_N;
    global i_N;
    global M_VN;
    global U_VN;

    global i_VN;
    global i_GN;

    global p;

    g1 = [-polyval(polyder(p.*r_V),x(1)), 0, 0]; % polyder возвращает производную полинома 'p'
    g2 = [c_e * omega_N * Fi_N * x(3), -i_GN * r_YA, c_e * omega_N * Fi_N * x(1)];
    g3 = [-c_M * Fi_N * i_GN * x(2), -c_M * Fi_N * i_GN * x(1), 0];
    g = [g1; g2; g3];

    end