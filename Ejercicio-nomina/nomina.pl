% Declaración de predicados dinámicos
:- dynamic docente/2.

% Definición de constante para el salario minimo
salario_minimo(1000000). % Puedes ajustar este valor según sea necesario

% Datos de ejemplo
docente(juan_perez, auxiliar).
docente(maria_rodriguez, asociado).
docente(carlos_gomez, titular).

% Cálculo del salario base según la categoría
salario_base(Categoria, SalarioBase) :-
    salario_minimo(SalarioMinimo),
    (   Categoria = auxiliar -> SalarioBase is SalarioMinimo * 3
    ;   Categoria = asociado -> SalarioBase is SalarioMinimo * 5
    ;   Categoria = titular -> SalarioBase is SalarioMinimo * 7
    ).

% Deducciones
deduccion_salud(SalarioBase, DeduccionSalud) :-
    DeduccionSalud is SalarioBase * 0.04.

deduccion_pension(SalarioBase, DeduccionPension) :-
    DeduccionPension is SalarioBase * 0.04.

% Bonificaciones
bonificacion(auxiliar, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.05.
bonificacion(asociado, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.1.
bonificacion(titular, SalarioBase, Bonificacion) :-
    Bonificacion is SalarioBase * 0.15.

% Cálculo del salario neto
salario_neto(NombreDocente, SalarioNeto) :-
    docente(NombreDocente, Categoria),
    salario_base(Categoria, SalarioBase),
    deduccion_salud(SalarioBase, DeduccionSalud),
    deduccion_pension(SalarioBase, DeduccionPension),
    bonificacion(Categoria, SalarioBase, Bonificacion),
    SalarioNeto is SalarioBase - DeduccionSalud - DeduccionPension + Bonificacion.