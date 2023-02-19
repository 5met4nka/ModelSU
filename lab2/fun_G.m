% вычисление значений матрицы частных производных G(x, u)
function g = fun_G(x,u)
    global p;
    global a21 a22 a23 a32;
    g1 = [ -polyval(polyder(p),x(1)), 0, 0]; % polyder возвращает производную полинома 'p'
    g2 = [a21*x(3), -a22-a23*u(3), a21*x(1)];
    g3 = [-a32*x(2), -a32*x(1), 0];
    g = [g1; g2; g3];
    end