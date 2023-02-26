% вычисление значений матрицы частных производных G(x, u)
function g = fun_G(x,u)

    global r_JA;
    global w;
    global C_e;
    global C_M;
    
    global p;

    g1 = [ -polyval(polyder(p./w),x(1)), 0, 0]; % polyder возвращает производную полинома 'p'
    g2 = [C_e*x(3), r_JA, C_e*x(1)];
    g3 = [-C_M*x(2), -C_M*x(1), 0];
    g = [g1; g2; g3];

    end