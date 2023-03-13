function [res_x]=scheme()
    global A B C D t
    u=[zeros(1, length(t));0.1*ones(1,length(t))];
    x0=[0;0;0];
    [res_x]=lsim(A, B, C, D, t, x0, u);
end