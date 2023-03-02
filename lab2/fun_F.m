% вычисление значения функции f(x, u)
function f = fun_F(x,u)

    global r_V;
    global r_YA;
    global w;
    global L_YA;
    global R_0;
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

    f1 = i_N * R_0 * u(2) - polyval(p.*r_V/w, x(1));
    f2 = c_e * omega_N * Fi_N * x(3) * x(1) - i_GN * r_YA * x(2) - i_N * R_0 * u(2);
    f3 = M_VN * u(1) - c_M * Fi_N * i_GN * x(1) * x(2);
    f = [f1; f2; f3];

    end