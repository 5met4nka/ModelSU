function f=fun_F(x,u)
p = [0.0652531464530903 0 -0.417793814270038 0 1.24716103354177 0];
f=[u(1)-(p(1)*x(1)^5 + p(3)*x(1)^3 + p(5)*x(1)); x(1)*x(3)-x(2)*(1+u(3)); u(2)-x(1)*x(2)];
end