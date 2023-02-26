% вычисление значения функции f(x, u)
function f = fun_F(x,u)

    global r_JA;
    global w;
    global C_e;
    global C_M;
    global i_N;
    global p;

    f1 = i_N * u(2) - polyval(p./w, x(1));
    f2 = C_e * x(3) * x(1) - r_JA * x(2) - i_N * u(3);
    f3 = u(1) - C_M * x(1) * x(2);
    f = [f1; f2; f3];

    end