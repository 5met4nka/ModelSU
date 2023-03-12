figure('name', 'M=1 R=1');

subplot(2,3,1);
plot(out.tout, out.Fi.Data);
grid on;
grid minor;
xlabel('t');
ylabel('Fi');

subplot(2,3,2);
plot(out.tout, out.i_G.Data);
xlabel('t');
ylabel('i_G');
grid on;
grid minor;

subplot(2,3,3);
plot(out.tout, out.w.Data);
grid on;
grid minor;
xlabel('t');
ylabel('w');

subplot(2,3,4);
plot(out.Fi.Data, out.i_G.Data);
grid on;
grid minor;
xlabel('Fi')
ylabel('i_Г')

subplot(2,3,5);
plot(out.w.Data, out.i_G.Data);
grid on; 
grid minor;
xlabel('w')
ylabel('i_Г')

subplot(2,3,6);
plot(out.Fi.Data, out.w.Data);
grid on; 
grid minor;
xlabel('Fi')
ylabel('w')