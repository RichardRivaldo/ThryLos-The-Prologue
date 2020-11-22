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

/* Definisi 

/* Definisi Show Map */

map(SX, SY) :-          (isWall(SX, SY) -> write('#');
                        player(SX, SY) -> write('P');
                        store(SX, SY) -> write('S');
                        dungeon(SX, SY) -> write('D');
                        quest(SX, SY) -> write('Q');
                        innerWall(SX, SY) -> write('#');
                        teleport(SX, SY) -> write('T');
                        write('-')), NewX is SX + 1, 
                        (SX = 15, SY = 0 -> nl;
                        SX = 15 -> nl, X = 0, NewY is SY - 1, map(X, NewY);
                        map(NewX, SY)).

/* Definisi Valid Move */

validMove(PrevX, PrevY, NewX, NewY) :-  (store(NewX, NewY) -> write('Don\'t just stand there. Come enter The Almighty ThryStore!'), nl, nl, visitStore;
                                        teleport(NewX, NewY) -> write('Entering The Registrated Dimensional Gates..'),  nl, nl, teleport;
                                        isWall(NewX, NewY), taken(NewX, NewY) ->
                                        retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)), 
                                        write('OOPS! Mirror mirror on the wall, CAN YOU SEE THE HUGE WALL OF THRYLOS?'), 
                                        nl, !, fail;
                                        innerWall(NewX, NewY), taken(NewX, NewY) ->
                                        retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)), 
                                        write('The Wall here is too high. You can\'t climb it over with your short feet!'), 
                                        nl, !, fail;
                                        write('')).

/* Definisi Move */

:- dynamic(player/2).
w :-                    retract(player(PrevX, PrevY)), NewY is PrevY + 1,
                        asserta(player(PrevX, NewY)),
                        write('You took a step forward. Just don\'t crash into anything!'), nl,
                        validMove(PrevX, PrevY, PrevX, NewY).

d :-                    retract(player(PrevX, PrevY)), NewX is PrevX + 1,
                        asserta(player(NewX, PrevY)), 
                        write('Got your way to the right. Be careful, don\'t trip yourself!'), nl,
                        validMove(PrevX, PrevY, NewX, PrevY).

a :-                    retract(player(PrevX, PrevY)), NewX is PrevX - 1,
                        asserta(player(NewX, PrevY)), 
                        write('Yes, proceeding to the left. Stay on guard wherever you are going!'), nl,
                        validMove(PrevX, PrevY, NewX, PrevY).

s :-                    retract(player(PrevX, PrevY)), NewY is PrevY - 1,
                        asserta(player(PrevX, NewY)), 
                        write('Going backward immediately. Don\'t try to do Moon Walk as you might just bump into something!'), nl,
                        validMove(PrevX, PrevY, PrevX, NewY).
                        
/* Definisi Init Map */

:- dynamic(store/2).
:- dynamic(dungeon/2).
:- dynamic(quest/2).
:- dynamic(teleport/2).
:- dynamic(innerWall/2).

initMap :-              generate(15, 15), 
                        asserta(player(2, 10)), asserta(isTaken(2, 10)),
                        asserta(quest(5, 7)), asserta(isTaken(5, 7)),
                        asserta(store(4, 13)), asserta(isTaken(4, 13)),
                        asserta(dungeon(13, 4)), asserta(isTaken(13, 4)),
                        asserta(teleport(9,14)), asserta(isTaken(9, 14)),
                        asserta(teleport(3, 2)), asserta(isTaken(3, 2)),
                        asserta(innerWall(11, 10)), asserta(isTaken(11, 10)),
                        asserta(innerWall(10, 10)), asserta(isTaken(10, 10)),
                        asserta(innerWall(9, 10)), asserta(isTaken(9, 10)),
                        asserta(innerWall(9, 11)), asserta(isTaken(9, 11)),
                        asserta(innerWall(8, 10)), asserta(isTaken(8, 10)),
                        asserta(innerWall(7, 10)), asserta(isTaken(7, 10)),
                        asserta(innerWall(7, 9)), asserta(isTaken(7, 9)),
                        asserta(innerWall(6, 4)), asserta(isTaken(6, 4)),
                        asserta(innerWall(6, 5)), asserta(isTaken(6, 5)),
                        asserta(innerWall(5, 5)), asserta(isTaken(5, 5)),
                        asserta(innerWall(4, 5)), asserta(isTaken(4, 5)),
                        asserta(innerWall(14, 2)), asserta(isTaken(14, 2)),
                        asserta(innerWall(13, 2)), asserta(isTaken(13, 2)),
                        asserta(innerWall(12, 2)), asserta(isTaken(13, 2)),
                        asserta(innerWall(11, 2)), asserta(isTaken(11, 2)),
                        asserta(innerWall(14, 6)), asserta(isTaken(14, 6)),
                        asserta(innerWall(13, 6)), asserta(isTaken(13, 6)),
                        asserta(innerWall(12, 6)), asserta(isTaken(12, 6)),
                        asserta(innerWall(11, 6)), asserta(isTaken(11, 6)),
                        asserta(innerWall(11, 5)), asserta(isTaken(11, 5)),
                        asserta(innerWall(11, 3)), asserta(isTaken(11, 3)),

                        write('Successfully generating the Territory of ThryLos.'), nl.

teleport :-             write('--------------------------------------------------------------------'), nl,
                        write('               ThryLos Official Dimensional Gates'), nl,
                        write('--------------------------------------------------------------------'), nl, nl,
                        write('Good day, travelers. We are here to help you move efficiently.'), nl,
                        write('Just pinpoint the place that you want to go. Make sure it is not a wall or any places, we don\'t have any insurance here!'), nl,
                        write('Our Gates required great amount of resources, so we will take 20 golds as your payments.'), nl, nl,
                        write('Now, do you want to use our service (`yes.` or `no.`)? '), read(Choice), nl,
                        (Choice == no -> write('We respect your choice. Come back when you need us!'), nl;
                        Choice == yes -> write('Enter the X-Absis position that you desired: '), read_integer(XT),
                        write('Enter the Y-Ordinat position that you desired: '), read_integer(YT), nl,
                        (isWall(XT, YT) -> write('We can\'t take the risk by transporting you to the wall!'), fail, nl;
                        innerWall(XT, YT) -> write('The Wall itself is thorny. We don\'t want our hero to be hurt!'), nl;
                        (class(User, _), gold(User, Gold), Gold >= 20 -> write('Leggo then. Entering the gates..'), nl,
                        player(PrevX, PrevY), retract(player(PrevX, PrevY)), asserta(player(XT, YT)), 
                        retract(gold(User, Gold)), NewGold is Gold - 20, asserta(gold(User, NewGold)),
                        write('-------------------------------whoosh-------------------------------'), nl,
                        write('Successfully teleported. May we meet again, travelers. Goodbye!'), nl, nl,
                        validMove(PrevX, PrevY, XT, YT);
                        write('Too bad, we want to travel with you but you don\'t have enough money. Come back later!'), nl))).