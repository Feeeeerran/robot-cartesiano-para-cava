classdef Cava
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here

    properties
        % Valores globales del espacio de trabajo
        c_ancho = 0.1;
        c_alto = 0.1;
        alto = 1.8;

        % Propiedades caracteristicas de la cava
        largo;
        cant_bt_alto;
        cant_bt_largo;
        cant_bt;
        coord;
    end

    methods
        % Constructor
        % largo : largo de la cava en m
        % alto : ancho de la cava en m
        function obj = Cava(largo, coord)
            obj.largo = largo;
            obj.cant_bt_alto = (obj.alto / obj.c_alto);
            obj.cant_bt_largo = (obj.largo / obj.c_ancho);
            obj.cant_bt = obj.cant_bt_alto * obj.cant_bt_largo;
            obj.coord = coord;
        end

    end
end