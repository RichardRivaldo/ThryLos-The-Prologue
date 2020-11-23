/* quest.pl */

level(_Joceb,2).

getQuest(Menu) :- write('Welcome adventurer, may you help us?'),nl,
                    (Menu = 0 ->
                        write('Sorry, you already have another quest, please finish it first'),nl,
                        exitQuest;
                    Menu = 1 ->
                        level(_X,PlayerLevel),
                        write('[1] Easy Quest'), nl,
                        write('[2] Medium Quest'), nl,
                        write('[3] Hard Quest'), nl,
                        write('[0] Don\'t take a Quest'), nl,
                        write('Please pick your quest difficulty : '),nl,
                        read_integer(QuestDiff),nl,
                        (
                            QuestDiff =:= 0 ->
                                exitQuest;
                            QuestDiff =:= 1 ->
                                generateQuestEasy(PlayerLevel);
                            QuestDiff =:= 2 ->
                                generateQuestMedium(PlayerLevel);
                            QuestDiff =:= 3 ->
                                generateQuestHard(PlayerLevel)
                        )
                    ).

:- dynamic(generateQuestEasy/1).

generateQuestEasy(lvl) :- (lvl =:= 1 ->
                            (
                                asserta(slimetokill(2)),
                                asserta(goblintokill(1)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 2 slime, 1 goblin and 1 wolf'),nl,
                                generateQuestReward(3,6)
                            );
                            lvl =:= 2 ->
                            (
                                asserta(slimetokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 1 slime, 2 goblin and 1 wolf'),nl,
                                generateQuestReward(5,8)
                            );
                            lvl =:= 3 ->
                            (
                                asserta(spidertokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 2 goblin , 1 wolf and 1 spider'),nl,
                                generateQuestReward(7,10)
                            );
                            lvl =:= 4 ->
                            (
                                asserta(spidertokill(1)),
                                asserta(goblintokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 1 goblin , 2 wolf and 1 spider'),nl,
                                generateQuestReward(9,12)
                            );
                            lvl =:= 5 ->
                            (
                                asserta(spidertokill(1)),
                                asserta(zooltokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 wolf , 1 spider and 1 zool'),nl,
                                generateQuestReward(11,14)
                            );
                            lvl =:= 6 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(zooltokill(1)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 1 wolf , 2 spider and 1 zool'),nl,
                                generateQuestReward(13,16)
                            )
                            ).

:- dynamic(generateQuestMedium/1).

generateQuestMedium(lvl) :- (lvl =:= 1 ->
                            (
                                asserta(slimetokill(2)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 2 slime, 2 goblin and 1 wolf'),nl,
                                generateQuestReward(4,7)
                            );
                            lvl =:= 2 ->
                            (
                                asserta(slimetokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 1 slime, 2 goblin and 2 wolf'),nl,
                                generateQuestReward(6,9)
                            );
                            lvl =:= 3 ->
                            (
                                asserta(spidertokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 goblin , 2 wolf and 1 spider'),nl,
                                generateQuestReward(8,11)
                            );
                            lvl =:= 4 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(goblintokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 1 goblin , 2 wolf and 2 spider'),nl,
                                generateQuestReward(10,13)
                            );
                            lvl =:= 5 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(zooltokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 wolf , 2 spider and 1 zool'),nl,
                                generateQuestReward(12,15)
                            );
                            lvl =:= 6 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(zooltokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 1 wolf , 2 spider and 2 zool'),nl,
                                generateQuestReward(14,17)
                            )
                            ).

:- dynamic(generateQuestHard/1).

generateQuestHard(lvl) :- (lvl =:= 1 ->
                            (
                                asserta(slimetokill(2)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 slime, 2 goblin and 2 wolf'),nl,
                                generateQuestReward(6,9)
                            );
                            lvl =:= 2 ->
                            (
                                asserta(slimetokill(3)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 3 slime, 2 goblin and 2 wolf'),nl,
                                generateQuestReward(8,11)
                            );
                            lvl =:= 3 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 goblin , 2 wolf and 2 spider'),nl,
                                generateQuestReward(10,13)
                            );
                            lvl =:= 4 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(goblintokill(3)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 3 goblin , 2 wolf and 2 spider'),nl,
                                generateQuestReward(12,15)
                            );
                            lvl =:= 5 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(zooltokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 wolf , 2 spider and 2 zool'),nl,
                                generateQuestReward(14,17)
                            );
                            lvl =:= 6 ->
                            (
                                asserta(spidertokill(2)),
                                asserta(zooltokill(2)),
                                asserta(wolftokill(3)),
                                write('Your Quest is to kill 3 wolf , 2 spider and 2 zool'),nl,
                                generateQuestReward(16,19)
                            )
                            ).

generateQuestReward(Min,Max) :- random(Min,Max,QuestReward),
                            exp(X,curexp),
                            gold(X,curgold),
                            _QuestExpReward = (QuestReward*100) + curexp,
                            _QuestGoldReward = (QuestReward*150) + curgold.

/* Kalau Quest beres baru dapet ini, quest bisa beres dimana ajah*/
:- dynamic(updateExpAndGoldQuest/0).

updateExpAndGoldQuest :-
                        retract(exp(X,_)), asserta(exp(X,_QuestExpReward)),
                        retract(gold(X,_)), asserta(gold(X,_QuestGoldReward)).

exitQuest :- write('Thank you adventurer, may the odds be ever in your favor'),nl.

/* To Do
- Cek apakah player ada di Q
- Cek apakah player memiliki quest yang aktif
- Implement Progress dan finish Quest*/