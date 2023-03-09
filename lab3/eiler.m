function xh=eiler(F,t,h,x,u)
%
%   one-step integration of nonlinear equations system
%   by Eiler's method
%   subfunction of NSIM
%         . 
%         x(t) = F(x,u,t)   , x(t0) = x0
%
%
%               xh=eiler(F,t,h,x,u)
%
%
%    F - name of function which calculates right part of equations system
%         function y=F(x,u,t) have following input variables:
%	           x - system state vector (column);
%	           u - vector of controls (column),
%		       t - current time (number)
%        function calculates vector-column of gradients.
%    t - current time (number)
%    h - step of integration
%    u - current vector of controls (column)
%  
%
%   23.08.91
%
th=t;
xh=x;
w=x;
z=feval(F,w,u,th);
th=t+h;
xh=xh+h*z;