function [yout,xout]=nsim(F,G,t,u,x0,Method)  
    x=x0;
    h=t(2)-t(1);
    n=length(x0);
    i=0;
    xout=x;
    yout=feval(G,x,u(:,1),t(1));
    for j=1:length(t)-1,
        tt=t(j);
        uu=u(:,j);
        xh=feval(Method,F,tt,h,x,uu);
        tt=tt+h;
        x=xh;
        xout=[xout x];
        yout=[yout feval(G,x,uu,tt)];
        i=i+1;
        if i==5,
            clc
            tt
            x
            i=0;
        end
    end
end