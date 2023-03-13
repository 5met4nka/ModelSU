% вычисление значения функции f(x, u)
function f = fun_F(x,u)

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

    global F_N;

    global p;

    f1 = ((i_N * R_0N * w) / (r_V * F_N)) * u(2) - polyval(p, x(1));
    f2 = (c_e * omega_N * Fi_N) * x(1) * x(3) - (i_GN * r_YA) * x(2) - i_N * R_0N * u(2);
    f3 = (M_VN) * u(1) - (c_M * Fi_N * i_GN) * x(1) * x(2);
    f  = [f1; f2; f3];

end