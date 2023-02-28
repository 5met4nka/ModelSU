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
    
    global p;

    f1 = i_N * u(2) - polyval(p./w, x(1));
    f2 = c_e * x(3) * x(1) - r_YA * x(2) - i_N * u(3);
    f3 = u(1) - c_M * x(1) * x(2);
    f = [f1; f2; f3];

    end