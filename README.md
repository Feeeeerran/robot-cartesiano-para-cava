# Robot Cartesiano para el manejo de vinos en una cava

Este proyecto presenta el diseño, desarrollo e implementación de un robot cartesiano destinado a operar en una cava de vinos. El objetivo principal es optimizar el manejo de botellas, reduciendo la intervención humana y preservando las condiciones ambientales ideales para la conservación del vino.

## Objetivos del Proyecto

- Diseñar un sistema mecánico preciso para el movimiento del robot en la cava.
- Implementar un sistema de manipulación "pick and place" seguro y eficiente.
- Minimizar las alteraciones en las condiciones de temperatura, luz y humedad.
- Garantizar un transporte suave para evitar vibraciones o impactos en las botellas.
- Optimizar el tiempo y la eficiencia en las tareas de almacenamiento y selección.
- Monitorear en tiempo real el estado y posición del robot.


## Robot Cartesiano

- *Grados de libertad:* 4.
- *Tipos de articulaciones:*
  - Traslacional (q1, q2, q4).
  - Rotacional (q3).
- *Efector final:* Gripper diseñado para un agarre firme pero delicado.

## Cinemática y Dinámica

El robot utiliza trayectorias con perfiles de velocidad trapezoidal para realizar movimientos suaves y precisos. Las simulaciones dinámicas realizadas en MATLAB permitieron analizar fuerzas y torques, optimizando la selección de componentes como motores y trenes de engranajes.


## Conclusiones

Este proyecto establece una base sólida para un robot cartesiano eficiente en el manejo de botellas en cavas de vinos. A pesar de necesitar mejoras iterativas, los resultados actuales son prometedores, destacando la utilidad de herramientas como MATLAB para cálculos cinemáticos y dinámicos.

## Institución

- **Universidad Nacional de Cuyo (UNCuyo)**
- Ingeniería en Mecatrónica
- Asignatura: Microcontroladores y Electrónica de Potencia
