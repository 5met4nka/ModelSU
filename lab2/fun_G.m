% вычисление значений матрицы частных производных G(x, u)
function g = fun_G(x,u)

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

    g1 = [ -polyval(polyder(p./w),x(1)), 0, 0]; % polyder возвращает производную полинома 'p'
    g2 = [c_e*x(3), r_YA, c_e*x(1)];
    g3 = [-c_M*x(2), -c_M*x(1), 0];
    g = [g1; g2; g3];

    end