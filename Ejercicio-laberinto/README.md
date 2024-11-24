# Ejercicio Laberinto en prolog
Como proposito para esta practica se requiere que se geenra la representación del laberinto que se encuentra en este repositorio y que a partir de hechos y reglas se determine la solución del laberinto.

## Aclaraciones del código.
El código funciona con una representación del laberinto a partir de coordenadas cartesianas para cada una de las celdas del laberinto, además a partir de hechos, se establecen los cmainos o movimientos que pueden realizarse desde cada una de las celdas.

Luego de esto, se establece la función principal de resolver_Camino donde se asignan los valores de inicio y salida del laberinto y se llama a la regla que busca el camino solución del laberinto.

Se aprovecha la recursividad de Prolog para que por medio de el encontrar las coordenadas a las que se puede mover desde una celda se explore o no el camino a partir de esta celda según si esta ya o no agregada en la lista de celdas visitadas.

Desarrollado por:

- Arlo Ocampo - 20221020104
