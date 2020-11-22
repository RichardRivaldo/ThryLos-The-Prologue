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

map(SX, SY) :-          (rightZone(SX, SY) -> write('>');
                        leftZone(SX, SY) -> write('<');
                        isWall(SX, SY) -> write('#');
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
                                        rightZone(NewX, NewY) -> retract(zone(CZone)), NZone is CZone + 1, asserta(zone(NZone)), switchZoneR, !,
                                        write('Entering Next Zone..'), nl;
                                        leftZone(NewX, NewY) -> retract(zone(X)), XNew is X - 1, asserta(zone(XNew)), switchZoneL, !,
                                        write('Going to the Previous Zone..'), nl;
                                        isWall(NewX, NewY), taken(NewX, NewY) ->
                                        retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)), 
                                        write('OOPS! Mirror mirror on the wall, CAN YOU SEE THE HUGE WALL OF THRYLOS?'), 
                                        nl, !, fail;
                                        innerWall(NewX, NewY), taken(NewX, NewY) ->
                                        retract(player(NewX,NewY)), asserta(player(PrevX, PrevY)), 
                                        write('The Wall here is too high. You can\'t climb it over with your short feet!'), 
                                        nl, !, fail;
                                        isEncounter).

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
:- dynamic(zone/1).

initMap1 :-             generate(15,15), asserta(zone(1)),
                        asserta(player(6, 13)), asserta(isTaken(6, 13)),
                        asserta(quest(4, 6)), asserta(isTaken(4, 6)),
                        asserta(store(11, 9)), asserta(isTaken(11, 9)),
                        asserta(innerWall(7, 5)), asserta(isTaken(7, 5)),
                        asserta(innerWall(8, 5)), asserta(isTaken(8, 5)),
                        asserta(innerWall(13, 12)), asserta(isTaken(13, 12)),
                        asserta(innerWall(13, 13)), asserta(isTaken(13, 13)),
                        asserta(innerWall(12, 13)), asserta(isTaken(12, 13)),
                        asserta(innerWall(3, 10)), asserta(isTaken(3, 10)),
                        asserta(innerWall(11, 3)), asserta(isTaken(11, 2)),
                        asserta(innerWall(3, 11)), asserta(isTaken(3, 11)),
                        asserta(innerWall(3, 2)), asserta(isTaken(3, 2)),
                        asserta(rightZone(15, 8)), asserta(isTaken(15, 8)),

                        asserta(leftZone(-1,-1)), asserta(isTaken(-1,-1)),
                        asserta(teleport(-3,-3)), asserta(isTaken(-3,-3)).

initMap2 :-             generate(15,15),
                        asserta(player(1, 12)), asserta(isTaken(1, 12)),
                        asserta(quest(12, 13)), asserta(isTaken(12, 13)),
                        asserta(store(4, 5)), asserta(isTaken(4, 5)),
                        asserta(teleport(12, 4)), asserta(isTaken(12, 4)),
                        asserta(innerWall(7, 5)), asserta(isTaken(7, 5)),
                        asserta(innerWall(8, 5)), asserta(isTaken(8, 5)),
                        asserta(innerWall(11, 9)), asserta(isTaken(11, 9)),
                        asserta(innerWall(10, 9)), asserta(isTaken(10, 9)),
                        asserta(innerWall(10, 8)), asserta(isTaken(10, 8)),
                        asserta(innerWall(12, 13)), asserta(isTaken(12, 13)),
                        asserta(innerWall(4, 2)), asserta(isTaken(4, 2)),
                        asserta(innerWall(7, 6)), asserta(isTaken(7, 6)),
                        asserta(innerWall(4, 9)), asserta(isTaken(4, 9)),
                        asserta(innerWall(11, 3)), asserta(isTaken(11, 2)),
                        asserta(innerWall(3, 11)), asserta(isTaken(3, 11)),
                        asserta(rightZone(15, 3)), asserta(isTaken(15, 3)),
                        asserta(leftZone(0, 12)), asserta(isTaken(0, 12)).

initMap3 :-             generate(15, 15),
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
                        asserta(leftZone(0, 4)), asserta(isTaken(0, 4)),
                        asserta(rightZone(16,16)), asserta(isTaken(16, 16)). 

/* Definisi Teleport */

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
                        (rightZone(XT, YT) -> write('We cannot follow you to the other zone, but good luck!'), nl, 
                        retract(gold(User, Gold)), NewGold is Gold - 20, asserta(gold(User, NewGold)), validMove(PrevX, PrevY, XT, YT);
                        leftZone(XT, YT) -> write('We cannot follow you to the other zone, but good luck!'), nl, 
                        retract(gold(User, Gold)), NewGold is Gold - 20, asserta(gold(User, NewGold)), validMove(PrevX, PrevY, XT, YT);
                        isWall(XT, YT) -> write('We can\'t take the risk by transporting you to the wall!'), fail, nl;
                        innerWall(XT, YT) -> write('The Wall itself is thorny. We don\'t want our hero to be hurt!'), nl;
                        (class(User, _), gold(User, Gold), Gold >= 20 -> write('Leggo then. Entering the gates..'), nl,
                        player(PrevX, PrevY), retract(player(PrevX, PrevY)), asserta(player(XT, YT)), 
                        retract(gold(User, Gold)), NewGold is Gold - 20, asserta(gold(User, NewGold)),
                        write('-------------------------------whoosh-------------------------------'), nl,
                        write('Successfully teleported. May we meet again, travelers. Goodbye!'), nl, nl,
                        validMove(PrevX, PrevY, XT, YT);
                        write('Too bad, we want to travel with you but you don\'t have enough money. Come back later!'), nl))).


/* Definisi Switch Zone */

switchZoneR :-      retractall(player(_,_)),
                    retractall(store(_,_)), retractall(leftZone(_,_)),
                    retractall(rightZone(_,_)), retractall(store(_,_)),
                    retractall(dungeon(_,_)), retractall(quest(_,_)),
                    retractall(innerWall(_,_)), retractall(teleport(_,_)),
                    retractall(isTaken(_,_)), zone(X),
                    (X = 2 -> initMap2, retract(player(_,_)), leftZone(LZX, LZY), 
                    PZX is LZX + 1, asserta(player(PZX, LZY)); 
                    initMap3, retract(player(_,_)), leftZone(LZX, LZY), 
                    PZX is LZX + 1, asserta(player(PZX, LZY))).

switchZoneL :-      retractall(player(_,_)),
                    retractall(store(_,_)), retractall(leftZone(_,_)),
                    retractall(rightZone(_,_)), retractall(store(_,_)),
                    retractall(dungeon(_,_)), retractall(quest(_,_)),
                    retractall(innerWall(_,_)), retractall(teleport(_,_)),
                    retractall(isTaken(_,_)), zone(X),
                    (X = 1 -> initMap1, 
                    retract(player(_,_)), rightZone(RZX, RZY), 
                    PZX is RZX - 1, asserta(player(PZX, RZY)); 
                    initMap2,
                    retract(player(_,_)), rightZone(RZX, RZY), 
                    PZX is RZX - 1, asserta(player(PZX, RZY))).