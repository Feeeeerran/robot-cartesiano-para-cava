clear all; clc


%% Importamos el modelo fisico
modelo_fisico;
cinematica;

%% Dinamicas para las trayectorias
% Par de torques y fuerzas a realizar cuando se obtiene una botella

tray1_fuerzas = zeros(numel(t),4);

tray2_fuerzas = zeros(numel(t),4);

for i = 1:numel(t)
    tray1_fuerzas(i,:) = inverseDynamics(robot, tray1_q(:,i)', tray1_qd(:,i)', tray1_qdd(:,i)');

    tray2_fuerzas(i,:) = inverseDynamics(robot, tray2_q(:,i)', tray2_qd(:,i)', tray2_qdd(:,i)');
    
end

% Separamos a q3
tray1_q3_T = tray1_fuerzas(:,3);
tray1_fuerzas(:,3) = [];

tray2_q3_T = tray2_fuerzas(:,3);
tray2_fuerzas(:,3) = [];


% Trayectoria 1 ---------------------------
% figure('Name','Fuerzas y torques tray1')
% subplot(2,1,1);
% plot(t, tray1_fuerzas,LineWidth=1.5); grid on;
% title('Fuerzas en q1, q2 y q4')
% legend('q1','q2','q4');
% 
% subplot(2,1,2);
% plot(t, tray1_q3_T,LineWidth=1.5); grid on;
% title('Torque en q3')

% Trayectoria 2 ---------------------------
figure('Name','Fuerzas y torques tray1')
subplot(2,1,1);
plot(t, tray2_fuerzas,LineWidth=1.5); grid on;
title('Fuerzas en q1, q2 y q4')
legend('q1','q2','q4');

subplot(2,1,2);
plot(t, tray2_q3_T,LineWidth=1.5); grid on;
title('Torque en q3')




