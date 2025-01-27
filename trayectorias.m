clear all; clc


%% Importamos el modelo fisico
modelo_fisico;

%% Trayectorias

% Definimos posicion final e inicial, de los cuales necesitamos los valores
% de las articulaciones en esas posiciones
q_i = robot.homeConfiguration;


q_f = picking(1, cava1);

% Definimos la matriz de waypoints (posiciones articulares a cumplir)
waypts = [q_i', q_f];

% Vector de tiempo
t = 0:0.02:2;

% Genera la trayectoria con un polinomio de 5o grado
[q,qd,qdd] = quinticpolytraj(waypts,[0 2],t);

% Genera un perfil trapezoidal de velocidad
[q,qd,qdd] = trapveltraj(waypts,numel(t),"EndTime",5);


% Existen otros interpoladores como
% cubicpolytraj   -> polinomio de 3er orden
% bsplinepolytraj -> genera trayectorias usando polinomios b-spline (bezier)
% minjerkpolytraj -> trayectorias con minimo jerk

% mstraj para convertir a trayectoria continua

% Plot de velocidades y posiciones articulares
% figure('Name','Posicion y velocidad')
% subplot(2,1,1);
% plot(t,qd(1,:));
% grid
% subplot(2,1,2);
% plot(t,q(1,:));
% % grid on;








