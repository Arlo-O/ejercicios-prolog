% caminos entre coordenadas (X1, Y1), (X2, Y2)
inicio((2,1)).
salida((2,6)).

camino((1,1),(1,2)).
camino((2,1),(3,1)).
camino((2,1),(2,2)).
camino((3,1),(4,1)).
camino((3,1),(2,1)).
camino((3,1),(3,2)).
camino((4,1),(3,1)).
camino((4,1),(4,2)).
camino((5,1),(6,1)).
camino((5,1),(5,2)).
camino((6,1),(5,1)).
camino((1,2),(1,1)).
camino((1,2),(1,3)).
camino((2,2),(1,2)).
camino((2,2),(3,2)).
camino((3,2),(3,1)).
camino((3,2),(2,2)).
camino((4,2),(4,1)).
camino((4,2),(4,3)).
camino((5,2),(5,1)).
camino((5,2),(5,3)).
camino((6,2),(6,3)).
camino((1,3),(1,2)).
camino((1,3),(2,3)).
camino((2,3),(1,3)).
camino((2,3),(3,3)).
camino((2,3),(2,4)).
camino((3,3),(2,3)).
camino((3,3),(3,4)).
camino((4,3),(4,2)).
camino((4,3),(4,4)).
camino((5,3),(5,2)).
camino((5,3),(5,4)).
camino((6,3),(6,2)).
camino((6,3),(6,4)).
camino((1,4),(1,5)).
camino((2,4),(2,3)).
camino((2,4),(2,5)).
camino((3,4),(3,3)).
camino((3,4),(4,4)).
camino((4,4),(3,4)).
camino((4,4),(4,3)).
camino((5,4),(5,3)).
camino((5,4),(5,5)).
camino((6,4),(6,3)).
camino((6,4),(6,5)).
camino((1,5),(1,4)).
camino((1,5),(1,6)).
camino((2,5),(2,4)).
camino((2,5),(3,5)).
camino((3,5),(2,5)).
camino((3,5),(4,5)).
camino((4,5),(3,5)).
camino((4,5),(5,5)).
camino((4,5),(4,6)).
camino((5,5),(5,4)).
camino((5,5),(4,5)).
camino((6,5),(6,4)).
camino((6,5),(6,6)).
camino((1,6),(1,5)).
camino((1,6),(2,6)).
camino((2,6),(1,6)).
camino((2,6),(3,6)).
camino((3,6),(2,6)).
camino((3,6),(4,6)).
camino((4,6),(4,5)).
camino((4,6),(3,6)).
camino((4,6),(5,6)).
camino((5,6),(4,6)).
camino((5,6),(6,6)).
camino((6,6),(6,5)).
camino((6,6),(5,6)).

% Encuentra el camino desde el inicio hasta la salida
resolver_camino(Camino) :-
    inicio(Inicio), % Asigna a la variable Inicio el hecho declarado como inicio
    salida(Salida), % Asigna a la variable Salida el hecho declarado com osalida
    buscar_camino(Inicio, Salida, [Inicio], Camino), % LLama a buscar_camino pasando la pos.inicial, la pos.final, una lista que contiene las celdas visitadas (solo el incio al empezar)
    writeln(Camino).

% Caso base: si la posición actual es la salida, el camino se ha encontrado y retorna el camino actual.
buscar_camino(Salida, Salida, CaminoActual, CaminoActual).

% Caso recursivo: moverse a una celda adyacente no visitada.
buscar_camino(PosActual, Salida, Visitadas, Camino) :-
    camino(PosActual, ProximaPos), % Busca las celdas a las que se puede mover basado en la base de conocimientos
    % Si ProximaPos no esta en la lista Visitadas prolog continua explorando esta celda
    % Si esta en la lista Visitadas, entonces se evita y no se sigue explorando en esa dirección
    \+ member(ProximaPos, Visitadas), % Negación de member verifica si PorximaPos ya esta en la lista de visitadas
    %Se llama a buscar_camino recursivamente:
    % Desde ProximaPos añadiendola a Visitadas
    buscar_camino(ProximaPos, Salida, [ProximaPos|Visitadas], Camino).
