clc
clear
close

R0 = 4;
In = 100;
Un = In * R0;

Un = Uv;
Rv = Uv / Iv;

привет

F = [0 1.0 1.5 2.0 2.5 3.0 3.5 4.0 5.0]'.*1000./12346
F1 = ([0 1.0 1.5 2.0 2.5 3.0 3.5 4.0 5.0] + 0.001)'.*1000./12346

Fnenorm = F.*12346
Fi = [0 0.66 0.93 1.18 1.38 1.5 1.6 1.67 1.79];

G1 = [];
G1(:,1) = Fi';
G1(:,2) = Fi'.^3;
C = inv(G1'*G1)*(G1'*F);
p1 = [C(2) 0 C(1) 0];
P1 = polyval(p1,Fi);
J = (F-G1*C)'*(F-G1*C);

G2 = [];
G2(:,1) = Fi';
G2(:,2) = Fi'.^3;
G2(:,3) = Fi'.^5;
C2 = inv(G2'*G2)*(G2'*F);
p2 = [C2(3) 0 C2(2) 0 C2(1) 0];
P2 = polyval(p2,Fi);

subplot(1, 2, 1);
plot(Fi, F,'*', Fi, P1, '--g',Fi ,P2);
legend('F(т)', 'p(т) n=3', 'p(т) n=5');
title('');
xlabel('т'); ylabel('F,p');
grid on;

Finn = Fi.*0.01;

G3 = [];
G3(:,1) = Finn';
G3(:,2) = Finn'.^3;
C3 = inv(G3'*G3)*(G3'*Fnenorm);
p3 = [C3(2) 0 C3(1) 0];
P3 = polyval(p3,Finn);

G4 = [];
G4(:,1) = Finn';
G4(:,2) = Finn'.^3;
G4(:,3) = Finn'.^5;
C4 = inv(G4'*G4)*(G4'*Fnenorm);
p4 = [C4(3) 0 C4(2) 0 C4(1) 0];
P4 = polyval(p4,Finn);

subplot(1, 2, 2);
plot(Finn, Fnenorm, '*', Finn, P3, 'g--', Finn, P4);
legend('F(т)', 'p(т) n=3', 'p(т) n=5');
title('');
xlabel('т'); ylabel('F,p');
grid on;