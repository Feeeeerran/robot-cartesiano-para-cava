clc; clear all;
modelo_fisico


%% Posiciones de valor para el manejo de botellas

% Obtener una botella del sector de picking (botella n)
n_pick = 1;
pick_botella = posicionamiento(n_pick, pick);

% Colocar o sacar botella en cava1 o cava 2
n_bot = 360;
col_botella = posicionamiento(n_bot, cava1);

% Dejar una botella en el drop
n_drop = 2; 
drop_botella = posicionamiento(n_drop, drop);

%% Meter el gripper dentro de la celda
pick_botella_fin = pick_botella;
pick_botella_fin(4) = pick.coord(2);

col_botella_fin = col_botella;
col_botella_fin(4) = abs(cava1.coord(2));

drop_botella_fin = drop_botella;
drop_botella_fin(4) = drop.coord(2);


%% Posibles trayectorias de trabajo
% La tarea deberia realizarse en un tiempo de 10s 
t = 0:0.1:15;

% Se usara trapveltraj que genera trayectorias segun un perfil de velocidad
% trapezoidal

% PRIMER TRAYECTORIA ////////////////////////////////////////////////
% Obtener una botella del picking y trasladarla a un espacio en cava1
waypts = [pick_botella, col_botella];
% 
[tray1_q, tray1_qd, tray1_qdd] = trapveltraj(waypts, numel(t));
% grabacion('tray1',tray1_q, robot);



% SEGUNDA TRAYECTORIA ////////////////////////////////////////////////
% Obtener una botella de la cava1 y dejar en drop
waypts = [col_botella, drop_botella];

[tray2_q, tray2_qd, tray2_qdd] = trapveltraj(waypts, numel(t));
% grabacion('tray2',tray2_q, robot);

%% Separacion de q3
% Separamos q3 para plotear
% Trayectoria 1
% tray1_q3_q = rad2deg(tray1_q(3,:));
% tray1_q3_qd = tray1_qd(3,:);
% tray1_q3_qdd = tray1_qdd(3,:);
% 
% tray1_q(3,:) = [];
% tray1_qd(3,:) = [];
% tray1_qdd(3,:) = [];
% 
% % Trayectoria 2
% tray2_q3_q = rad2deg(tray2_q(3,:));
% tray2_q3_qd = tray2_qd(3,:);
% tray2_q3_qdd = tray2_qdd(3,:);
% 
% tray2_q(3,:) = [];
% tray2_qd(3,:) = [];
% tray2_qdd(3,:) = [];

%% Velocidades y aceleraciones
% Primer trayectoria /////////////////////////


% % Posiciones -----------------------------------
% figure('Name','Posiciones tray1')
% subplot(2,1,1);
% plot(t, tray1_q,LineWidth=1.5); grid on;
% title('Posicion en q1, q2 y q4')
% legend('q1','q2','q4');
% 
% subplot(2,1,2);
% plot(t, tray1_q3_q,LineWidth=1.5); grid on;
% title('Posicion en q3')
% 
% 
% % Velocidades -----------------------------------
% figure('Name','Velocidades tray1')
% subplot(2,1,1);
% plot(t, tray1_qd/10,LineWidth=1.5); grid on;
% title('Velocidad en q1, q2 y q4')
% legend('q1','q2','q4');
% 
% subplot(2,1,2);
% plot(t, tray1_q3_qd/10,LineWidth=1.5); grid on;
% title('Velocidad en q3')


% % Segunda trayectoria /////////////////////////
% Posiciones -----------------------------------
% figure('Name','Posiciones tray 2')
% subplot(2,1,1);
% plot(t, tray2_q,LineWidth=1.5); grid on;
% title('Posicion en q1, q2 y q4')
% legend('q1','q2','q4');
% 
% subplot(2,1,2);
% plot(t, tray2_q3_q,LineWidth=1.5); grid on;
% title('Posicion en q3')
% 
% 
% % Velocidades -----------------------------------
% figure('Name','Velocidades tray 2')
% subplot(2,1,1);
% plot(t, tray2_qd/10,LineWidth=1.5); grid on;
% title('Velocidad en q1, q2 y q4')
% legend('q1','q2','q4');
% 
% subplot(2,1,2);
% plot(t, tray2_q3_qd/10,LineWidth=1.5); grid on;
% title('Velocidad en q3')






