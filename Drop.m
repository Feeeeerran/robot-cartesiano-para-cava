classdef Drop
    % La class Drop se diferencia de la class Cava por ser un espacio con
    % solo 4 celdas y siendo estas mas amplias que las de las cavas comunes

    properties
        % El drop solo cuenta con 4 espacios para botellas
        cant_bt = 4;
        cant_bt_alto = 2;
        cant_bt_largo = 2;
        % Espacio de las celdas
        c_ancho = 0.12;
        c_alto = 0.13;
        
        % Alto de la cava
        alto = 1.8;

        % Alto del drop de botellas
        drop_alto = 1.2;

        % Propiedades caracteristicas del drop
        largo;
        coord;
    end

    methods
        % Constructor
        % largo : largo de la cava en m
        % alto : ancho de la cava en m
        function obj = Drop(largo, coord)
            obj.largo = largo;
            obj.coord = [
                coord(1) + (largo/2 - obj.c_ancho)
                coord(2)
                obj.drop_alto
                ];
        end

    end
end