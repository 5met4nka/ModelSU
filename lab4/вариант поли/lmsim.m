function [result_x]=lmsim(a,b,c,d,t,x0,u)
    h=t(2)-t(1);
    [m,n]=size(a);
    [m,nb]= size(b);
    s=expm([[a b]*h;zeros(nb,n+nb)]);
    p=s(1:n,1:n);
    g=s(1:n,n+1:n+nb);
    result_x=(ltitr(p, g, u.', x0.'))'; 
    % result_y=c*x+d*u;
end