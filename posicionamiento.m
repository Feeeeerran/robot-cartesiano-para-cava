function q_pos = posicionamiento(N, obj)
    % La funcion trabaja con el numero de la celda de la que se quiere extraer una botella 
    % Contamos con el objeto que nos da toda la info necesaria para el
    % picking
    


    if N > obj.cant_bt
        error('El numero supera la cantidad de celdas posibles');
    end
    

    % Obtenemos el numero de fila
    if rem(N, obj.cant_bt_largo) ~= 0
        fila = floor(N / obj.cant_bt_largo) + 1;
    else
        fila = floor(N / obj.cant_bt_largo);
    end


    % Obtenemos la columna
    col = N - (obj.cant_bt_largo * (fila - 1));


    % Obtenemos las posiciones articulares en base a las coordenadas
    q1 = ((col * obj.c_ancho) + obj.coord(1)) - obj.c_ancho/2;
    q2 = ((fila * obj.c_alto) + obj.coord(3)) - obj.c_alto/2;

    if obj.coord(2) > 0
        q3 = 0;
    else
        q3 = pi;
    end

    % Le restamos el largo del efector por que se introduce en una segunda
    % etapa (y un poco mas)
    q4 = abs(obj.coord(2)) - 0.3;
    

    % Finalmente armamos el vector de posicion
    q_pos = [q1   q2   q3    q4]';

end