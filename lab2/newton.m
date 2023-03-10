function [x] = newton(F,G,x0,u,e)

% solve nonlinear algebraic equation system by Newton methodÂ 
%
%         f(x,u)=0,
%                  -1
%         x   =x -g  (x ,u)*f(x,u )   , g(x,u)=grad(f(x,u))
%          k+1  k      k     k
%
%         x =x0;   |f(x   ,u)| < e
%          0           k+1
%
%         F - name of function which calculates y=f(x,u) (should be written - 'F')
%             function y=F(x,u) have following input variables:
%         G - name of function which calculates gradient f by x (written as 'G')
%             function g=G(x,u) have following input variables:
%         x - argument (vector column);
%         u - parameter's vector (vector column)
%        x0 - initial condition;
%         e - precision (number)

    t=0;
    y=feval(F,x0,u);
    x=x0;
    while(norm(y)>e)
        gr=feval(G,x,u);
        x=x-inv(gr)*y;
        y=feval(F,x,u);
        clc,disp(y)
    end

    end