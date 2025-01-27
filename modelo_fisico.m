clear all; clc

%% Parametros globales
g = 9.81;   % Gravedad

% Caracteristicas de las celdas en [m]
c_ancho = 0.1;
c_alto = 0.1;

% Alto de la cava en [m]
alto = 1.8;

% Distancia del robot a las cavas en [m]
c1_dist = 0.4;
c2_dist = 1;




%% Instancia de objetos
% (y > 0) ---------------------------
% La zona de pick puede considerarse como una cava
pick = Cava(0.3, [0 c2_dist 0]);

% Cava 2 es la cava adyacente, se encuentra entre el drop y el pick
cava2 = Cava(3.4, [pick.largo c2_dist 0]);


% Drop tiene la informacion acerca de donde se dejan las botellas
drop = Drop(0.3, [pick.largo + cava2.largo c2_dist 0]);

% (y < 0) ---------------------------
cava1 = Cava(4, [0 -c1_dist 0]);


%% Matriz de los parametros de Denavit y Hartenberg
dh = [
    % a     alpha    d     theta
      1     pi/2     1     pi/2;
      0    -pi/2     0     0;
      0     0        0     0;
      0     pi/2     0     pi/2;
];



%% Definimos un rigidBodyTree
% Esta clase me permite generar un objeto que permite agregar 
% eslabones y articulaciones relacionados entre si
robot = rigidBodyTree("DataFormat","row");
robot.Gravity = [0 0 -g];


%% ================ [ q1 ] ===============================================
% Primer cuerpo rigido  + articulacion q1 prismatica
b1 = rigidBody('b1');
b1.Mass = 65;                                   % Masa m1 [kg]
b1.CenterOfMass = [0 0.9 0];                    % Centro de masa
b1.Joint = rigidBodyJoint('q1','prismatic');    % Traslacional
b1.Joint.setFixedTransform(dh(1,:),'dh');       % DH
b1.Joint.JointAxis = [1 0 0];                   % q1 lo largo de x
b1.Joint.PositionLimits = [0 cava1.largo];      % limite de largo de cava
b1.Joint.HomePosition = 0;                      % home en 0

%% ================ [ q2 ] ===============================================
% Segundo cuerpo rigido + articulacion q2 prismatica sobre b1
b2 = rigidBody('b2');

b2.Joint = rigidBodyJoint('q2','prismatic');    % Traslacional
b2.Joint.setFixedTransform(dh(2 ,:),'dh');      % DH
b2.Joint.JointAxis = [0 1 0];                   % q2 a lo largo de z
b2.Joint.PositionLimits = [0 alto];             % limite a altura de cava
b2.Joint.HomePosition = alto/2;                 % home al medio de la altura de la cava


%% ================ [ q3 ] ===============================================
% Tercer cuerpo rigido + articulacion q3 rotativa sobre b2
b3 = rigidBody('b3');
b3.Mass = 2.27;                                 % Masa del disco
b3.CenterOfMass = [0.0368 0 0];                 % Centro de masa
b3.Inertia = [0.005 0.017 0.022 0 0 0];         % Inercia del disco [kg m^2]
b3.CenterOfMass = [0 0 0];                      % Centro de masa en el propio centro
b3.Joint = rigidBodyJoint('q3','revolute');     % Rotacional
b3.Joint.setFixedTransform(dh(3,:),'dh');       % DH
b3.Joint.JointAxis = [0 0 1];                   % q3 alrededor de z
b3.Joint.PositionLimits = [-pi pi];             % giro completo
b3.Joint.HomePosition = pi/2;                   % home en 90º (apunta a la base)


%% ================ [ q4 ] ===============================================
% Cuarto cuerpo rigido + articulacion q4 prismatica sobre b3
b4 = rigidBody('b4');

b4.Joint = rigidBodyJoint('q4','prismatic');    % Traslacional
b4.Joint.setFixedTransform(dh(4,:),'dh');       % DH
b4.Joint.JointAxis = [1 0 0];                   % q4 a lo largo de x
b4.Joint.PositionLimits = [0 c2_dist];          % limite distancia a la cava mas lejana
b4.Joint.HomePosition = 0;                      % home en 0
                     

%% Efector ================================================================
ef = rigidBody('ef');
ef.Mass = 4;                                    % Masa del efector + botella
ef.Joint = rigidBodyJoint('ef','fixed');        % Fijo (coord del efector)
tf_hom = eul2tform([-pi/2 0 -pi/2],'XYZ');      % Matriz de transformacion homog
ef.Joint.setFixedTransform(tf_hom);             % Por transformacion homogenea



%% Visuales
tForm = [eye(3).*0.001,[0 0 0]';[0 0 0 1]]; % Escalado para matlab

% addVisual(robot.Base,'Mesh',"modelos3d\stl\cava1.stl",tForm);    % Base (cava1)
% addVisual(robot.Base,'Mesh',"modelos3d\stl\cava2_pick_drop.stl",tForm);    % Base (cava2)
% addVisual(b1,'Mesh',"modelos3d\robot\stl\q1.stl",tForm);         % Primer eslabon
% addVisual(b3,'Mesh',"modelos3d\robot\stl\q3.stl",tForm);         % Tercer eslabon
% addVisual(ef,'Mesh',"modelos3d\robot\stl\gripper.stl",tForm);    % Efector


%% Se agregan al bodyTree
addBody(robot,b1,'base');
addBody(robot,b2,'b1');
addBody(robot,b3,'b2');
addBody(robot,b4,'b3');
addBody(robot,ef,'b4');


%% Visualizacion

% show(robot,Visuals="on")
% interactiveRigidBodyTree(robot)





