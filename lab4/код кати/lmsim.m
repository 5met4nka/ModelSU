function [y,x]=lmsim(a,b,c,d,u,t,x0)
    h=t(2)-t(1);
    % matrix exponent
    [m,n] = size(a);
    [m,nb] = size(b);
    s = expm([[a b]*h; zeros(nb,n+nb)]);
    p = s(1:n,1:n);
    g= s(1:n,n+1:n+nb);
    x=(ltitr(p,g,u',x0'))';
    y=c*x+d*u;
end