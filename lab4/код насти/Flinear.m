function Flinear(x0, x00, u)
    global t
    result_x=scheme();
    load_system('lr3'); %НЕЛИНЕЙНАЯ
    set_param('lr3/U1','After', num2str(u(1)));
    set_param('lr3/U2','After', num2str(u(2)));
    sim lr3
    figure('color','white');
    subplot(3,1,1);
    plot(Flow(:,1), Flow(:,2)+x00(1), '--k'); hold on; 
    plot(t, result_x(1,:)+x0(1),'-k');
    grid on; grid minor;
    xlabel('t'); ylabel('flow');
    legend('show');
    legend('Нелинейная система', 'Линеаризованная система', 'Location', 'eastoutside')
    subplot(3,1,2);
    plot(I(:,1), I(:,2)+x00(2), '--k'); hold on; 
    plot(t, result_x(2,:)+x0(2),'-k');
    grid on; grid minor;
    xlabel('t'); ylabel('i');
    legend('show');
    legend('Нелинейная система', 'Линеаризованная система', 'Location', 'eastoutside')
    subplot(3,1,3);
    plot(Freq(:,1), Freq(:,2)+x00(3), '--k');hold on;
    plot(t, result_x(3,:)+x0(3),'-k');
    grid on; grid minor;
    xlabel('t'); ylabel('w');
    legend('show');
    legend('Нелинейная система', 'Линеаризованная система', 'Location', 'eastoutside')
end