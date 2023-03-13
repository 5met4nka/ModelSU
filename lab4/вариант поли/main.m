clear, clc
%nominals 
U_n= 220; Uv_n = 220; Uc_n= 220; Mc_n = 300; i_n = 100; 
w_n = 100; cm = 120; ce = 130; J=1.2; L = 0.03; r_v = 97.2;
r=0.05; mp_n= 0.01; w = 3000;
p = [0.0762 0 0.1422 0]

xx=[2.0962; 1.1926; 0.7854];
pd=polyder(p);
A = [(-U_n*polyval(pd,xx(1))/(w*mp_n))  0                              0;
    ((-ce*w_n*mp_n)*xx(3))/(L*i_n)      (-i_n*r)/(L*i_n)               ((-ce*w_n*mp_n)*xx(1))/(L*i_n);
    ((cm*mp_n*i_n)*xx(2))/(J*w_n)       ((cm*mp_n*i_n)*xx(1))/(J*w_n)  0]
B = [Uv_n/(w*mp_n)  0              0;
     0              0              Uc_n/(L*i_n);
     0              -Mc_n/(J*w_n)  0]
C = [0                                  0  w_n;
     (-U_n*polyval(pd,xx(1))/(w*mp_n))  0  0]
D = [0 0 0;
     0 0 0]

t=0:0.01:10;
u=[0*ones(1, length(t)); 0.2*ones(1, length(t)); 0*ones(1, length(t))];
x0=[0;0;0];
[x] = lmsim(A,B,C,D,t,x0,u)

figure (1)
plot (t, x(1,:)+xx(1),    t, x(2,:)+xx(2),    t, x(3,:)+xx(3),    t, out.signals.values(:,1),    t, out.signals.values(:,2),    t, out.signals.values(:,3))
grid on

pp=poly(A)
lmd=roots(pp)

figure(2)
plot (real(lmd), imag(lmd), '*'), grid