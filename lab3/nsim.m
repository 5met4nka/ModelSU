function [yout,xout]=nsim(F,G,t,u,x0,Method)  
% simulation of nonlinear system having many inputs and outputs
%    
%         . 
%         x(t) = F(x,u,t)   , x(t0) = x0
%
%         y(t) = G(x,u,t)
%
%    F - name of function which calculates right part of equations system 
%    G - name of function which calculates outputs
%    t - time of simulation (stepped vector-string)
%    u - matrice of controls (number of columns is equal to length of vector t
%                             number of strings is equal to number of outputs)
%    x0 - vector-column of initial conditions
%    Method - method of integration
%             rk4s - 4-th degree Runge-Kutt's method
%             eiler - Eiler's method�
%             eilermod - modified Eiler's method
%
%    23.08.91
%
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
