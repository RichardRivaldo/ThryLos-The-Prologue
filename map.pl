/* map.pl */

/* Definisi Generate Coordinate */

:- dynamic(coordinate/2).
:- dynamic(width/1).
:- dynamic(height/1).
generate(X,Y) :-        (X = 0, Y = 0 -> asserta(coordinate(0, 0));
                        X = 0 -> asserta(coordinate(0,Y)), NewY is Y - 1, generate(X, NewY);
                        Y = 0 -> asserta(coordinate(X,Y)), NewY = 15, NewX is X - 1, generate(NewX, NewY);
		                asserta(coordinate(X, Y)), NewY is Y - 1, generate(X, NewY)).

/* Definisi Taken */

:- dynamic(isTaken/2).
taken(X, Y) :-          isTaken(X, Y).
taken(X, Y) :-          \+(isTaken(X,Y)), asserta(isTaken(X, Y)).

/* Definisi Wall */

isWall(X, Y) :-         Y =:= 15, coordinate(X, Y).
isWall(X, Y) :-         X =:= 0, coordinate(X, Y).
isWall(X, Y) :-         X =:= 15, coordinate(X, Y).
isWall(X, Y) :-         Y =:= 0, coordinate(X, Y).

/* Definisi Show Map */

map(SX, SY) :-          (isWall(SX, SY) -> write('#');
                        player(SX, SY) -> write('P');
                        store(SX, SY) -> write('S');
                        dungeon(SX, SY) -> write('D');
                        quest(SX, SY) -> write('Q');
                        teleport(SX, SY) -> write('T');
                        write('-')), NewX is SX + 1, 
                        (SX = 15, SY = 0 -> nl;
                        SX = 15 -> nl, X = 0, NewY is SY - 1, map(X, NewY);
                        map(NewX, SY)).

/* Definisi Valid Move */

validMove(PrevX, PrevY, NewX, NewY) :-  (isWall(NewX, NewY), taken(NewX, NewY),
                                        retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)), 
                                        write('Mirror mirror on the wall, CAN YOU SEE THE HUGE WALL OF THRYLOS?'), 
                                        nl, !, fail;
                                        write('')).

/* Definisi Move */

:- dynamic(player/2).
w :-                    retract(player(PrevX, PrevY)), NewY is PrevY + 1,
                        asserta(player(PrevX, NewY)), validMove(PrevX, PrevY, PrevX, NewY),
                        write('You took a step forward. Nice one, just don\'t crash into anything!'), nl.

d :-                    retract(player(PrevX, PrevY)), NewX is PrevX + 1,
                        asserta(player(NewX, PrevY)), validMove(PrevX, PrevY, NewX, PrevY),
                        write('Got your way to the right. Be careful, don\'t trip yourself!'), nl.

a :-                    retract(player(PrevX, PrevY)), NewX is PrevX - 1,
                        asserta(player(NewX, PrevY)), validMove(PrevX, PrevY, NewX, PrevY),
                        write('Yes, proceeding to the left. Stay on guard wherever you are going!'), nl.

s :-                    retract(player(PrevX, PrevY)), NewY is PrevY - 1,
                        asserta(player(PrevX, NewY)), validMove(PrevX, PrevY, PrevX, NewY),
                        write('Going backward immediately. Don\'t try to do Moon Walk as you might just bump into something!'), nl.
                        
/* Definisi Init Map */

:- dynamic(store/2).
:- dynamic(dungeon/2).
:- dynamic(quest/2).
:- dynamic(teleport/2).

initMap :-              generate(15, 15), 
                        asserta(player(12, 8)),
                        asserta(quest(5,7)),
                        asserta(store(4, 13)),
                        asserta(dungeon(10, 3)),
                        asserta(teleport(9,14)),
                        asserta(teleport(3, 2)),
                        write('Successfully generating the Territory of ThryLos.'), nl.
