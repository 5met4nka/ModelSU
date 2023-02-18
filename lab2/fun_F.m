% вычисление значения функции f(x, u)
function f = fun_F(x,u)
    global p;
    global a11 a21 a22 a23 a31 a32;
    f1 = a11*u(1) - polyval(p, x(1));
    f2 = a21*x(1)*x(3) - a22*x(2) - a23*x(2)*u(3);
    f3 = a31*u(2) - a32*x(1)*x(2);
    f = [f1; f2; f3];
    end