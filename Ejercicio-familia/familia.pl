
% Hechos básicos
padre(juan, camilo).
padre(juan, alejandra).
padre(carlos, juan).
padre(luis, carlos).
madre(ana, camilo).
madre(ana, alejandra).
madre(camila, juan).
madre(gabriela, carlos).

% Relaciones familiares
hijo(X, Y) :- padre(Y, X).
hijo(X, Y) :- madre(Y, X).

% X abuelo de Y si: X es padre/madre de Z y Y es hijo de Z (Z padre/madre de Y)
abuelo(X, Y) :- padre(X, Z), hijo(Y, Z).
abuelo(X, Y) :- madre(X, Z), hijo(Y, Z).

% X nieto si Y es abuelo de X
nieto(X, Y) :- abuelo(Y, X). 

% X tio de Y si: X es hermano de Z tal que Z es padre o madre de Y
tio(X, Y) :- hermano(X, Z), (padre(Z, Y); madre(Z, Y)).
% X hermano de Y si: Z padre/madre de X y Z padre/madre de Y y X y Y son diferentes
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.
hermano(X, Y) :- madre(Z, X), madre(Z, Y), X \= Y.

% X sobrino de Y si: Y es tio de X
sobrino(X, Y) :- tio(Y, X).

% X primo de Y si: Z es tio de X y Z es hijo de Y
primo(X, Y) :- tio(Z, X), hijo(Z, Y).

% Familiar
% X es familiar de Y si tienen alguna relacion tal que X es algo de Y
familiar(X, Y) :- padre(X, Y).
familiar(X, Y) :- madre(X, Y).
familiar(X, Y) :- abuelo(X, Y).
familiar(X, Y) :- nieto(X, Y).
familiar(X, Y) :- tio(X, Y).
familiar(X, Y) :- sobrino(X, Y).
familiar(X, Y) :- primo(X, Y).

% Familiares
% Encuentra todos los familiares de X, usando findall para todos los Y tales que X sea un familiar de Y 
familiares(X, Lista) :- findall(Y, familiar(X, Y), Lista).

% Casado
% X esta casado con Y si: X es padre/madre de Z y Y es padre/madre de Z y X y Y son diferentes
casado(X, Y) :- padre(X, Z), padre(Y, Z), X \= Y.

% Suegro
% X es suegro de Y si: Y esta casado con Z y X es padre de Z
suegro(X, Y) :- casado(Y, Z), padre(X, Z).

