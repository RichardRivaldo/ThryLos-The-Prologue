/* quest.pl */

getQuest(Menu) :- write('Welcome adventurer, may you help us?'),nl,
                    (Menu = 0 ->
                        write('Sorry, you already have another quest, please finish it first'),nl,
                        exitQuest
                    Menu = 1 ->
                        write('[1] Easy Quest')
                        write('[2] Medium Quest')
                        write('[3] Hard Quest')
                        write('[0] Don\'t take a Quest')
                        write('Please pick your quest difficulty : '), read_integer(QuestDiff),nl,
                        level(X,PlayerLevel),
                        (QuestDiff = 0 ->
                            exitQuest
                        QuestDiff = 1 ->
                            generateQuestEasy(PlayerLevel),
                        QuestDiff = 2 ->
                            generateQuestMedium(PlayerLevel),
                        QuestDiff = 3 ->
                            generateQuestHard(PlayerLevel),
                        );
                    ).

:- dynamic(generateQuest/1)

generateQuestEasy(level) :- (level = 1 ->
                                asserta(slimetokill(2)),
                                asserta(goblintokill(1)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 2 slime, 1 goblin and 1 wolf'),nl,
                            level = 2 ->
                                asserta(slimetokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 1 slime, 2 goblin and 1 wolf'),nl,
                            level = 3 ->
                                asserta(spidertokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 2 goblin , 1 wolf and 1 spider'),nl,
                            level = 4 ->
                                asserta(spidertokill(1)),
                                asserta(goblintokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 1 goblin , 2 wolf and 1 spider'),nl,
                            level = 5 ->
                                asserta(spidertokill(1)),
                                asserta(zooltokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 wolf , 1 spider and 1 zool'),nl,
                            level = 6 ->
                                asserta(spidertokill(2)),
                                asserta(zooltokill(1)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 1 wolf , 2 spider and 1 zool'),nl,
                            );.

generateQuestMedium(level) :- (level = 1 ->
                                asserta(slimetokill(2)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 2 slime, 2 goblin and 1 wolf'),nl,
                            level = 2 ->
                                asserta(slimetokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 1 slime, 2 goblin and 2 wolf'),nl,
                            level = 3 ->
                                asserta(spidertokill(1)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 goblin , 2 wolf and 1 spider'),nl,
                            level = 4 ->
                                asserta(spidertokill(2)),
                                asserta(goblintokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 1 goblin , 2 wolf and 2 spider'),nl,
                            level = 5 ->
                                asserta(spidertokill(2)),
                                asserta(zooltokill(1)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 wolf , 2 spider and 1 zool'),nl,
                            level = 6 ->
                                asserta(spidertokill(2)),
                                asserta(zooltokill(2)),
                                asserta(wolftokill(1)),
                                write('Your Quest is to kill 1 wolf , 2 spider and 2 zool'),nl,
                            );.

generateQuestHard(level) :- (level = 1 ->
                                asserta(slimetokill(2)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 slime, 2 goblin and 2 wolf'),nl,
                            level = 2 ->
                                asserta(slimetokill(3)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 3 slime, 2 goblin and 2 wolf'),nl,
                            level = 3 ->
                                asserta(spidertokill(2)),
                                asserta(goblintokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 goblin , 2 wolf and 2 spider'),nl,
                            level = 4 ->
                                asserta(spidertokill(2)),
                                asserta(goblintokill(3)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 3 goblin , 2 wolf and 2 spider'),nl,
                            level = 5 ->
                                asserta(spidertokill(2)),
                                asserta(zooltokill(2)),
                                asserta(wolftokill(2)),
                                write('Your Quest is to kill 2 wolf , 2 spider and 2 zool'),nl,
                            level = 6 ->
                                asserta(spidertokill(2)),
                                asserta(zooltokill(2)),
                                asserta(wolftokill(3)),
                                write('Your Quest is to kill 3 wolf , 2 spider and 2 zool'),nl,
                            );.

generateQuestReward(Min,Max) :- random(Min,Max,QuestReward),
                            exp(X,curexp),
                            gold(X,curgold),
                            QuestExpReward = (QuestReward*100) + curexp,
                            QuestGoldReward = (QuestReward*150) + curgold,
                            retract(exp(X,_)), asserta(exp(X,QuestExpReward)),
                            retract(gold(X,_)), asserta(gold(X,QuestGoldReward)).

exitQuest :- write('Thank you adventurer, may the odds be ever in your favor'),nl.