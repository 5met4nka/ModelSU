function [x] = newton(F,G,x0,u,e)
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