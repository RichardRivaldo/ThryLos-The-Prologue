/* map.pl */

/* Definisi Width */
width(X) :- X >= 0, X =< 15.

/* Definisi Height */
height(X) :- X >= 0, X =< 15.

/* Definisi Generate Coordinate */

coordinate(X, Y) :-     width(W), height(H), 
                        X =< W, X >= 0, 
                        Y =< H, Y >= 0, !.

/* Definisi Taken */

dynamic(isTaken/2).
taken(X, Y) :-          \+isTaken(X,Y), asserta(isTaken(X, Y)).

/* Definisi Wall */

iswall(X,Y) :-          X = 0, 