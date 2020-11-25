/* quest.pl */

/*debugging kit
level(_tes,3).


*/
level(_tes,3).
:-dynamic(monsterToKill/2).
:-dynamic(isQuestActive/1).

isQuestActive(no).
monsterToKill(slime,0).
monsterToKill(goblin,0).
monsterToKill(wolf,0).
monsterToKill(spider,0).
monsterToKill(zool,0).
monsterToKill(apex,0).

:- dynamic(getQuest/0).   

getQuest :- write('Welcome adventurer, may you help us?'),nl,
            isQuestActive(Check),
            (Check = yes ->
                write('Sorry, you already have another quest, please finish it first'),nl,
                exitQuest;
            Check = no ->
                retract(monsterToKill(slime,_)),
                retract(monsterToKill(goblin,_)),
                retract(monsterToKill(wolf,_)),
                retract(monsterToKill(spider,_)),
                retract(monsterToKill(zool,_)),
                retract(monsterToKill(apex,_)),
                level(_X,PlayerLevel),
                write('     _____________________'), nl,
                write('()==(      Quest List     (@==()'), nl,
                write('     \'____________________\'|'), nl,
                write('       |                   |'), nl,
                write('       |                   |'), nl,   
                write('       |                   |'), nl,             
                write('       |  [1] Easy Quest   |'), nl,
                write('       |  [2] Medium Quest |'), nl,
                write('       |  [3] Hard Quest   |'), nl,
                write('       |  [0] Exit         |'), nl,
                write('       |                   |'), nl,
                write('       |                   |'), nl,
                write('       |                   |'), nl,
                write('     __)___________________|'), nl,
                write('()==(                     (@==()'), nl,
                write('     \'--------------------\''), nl,
                write('Please pick your quest difficulty : '),read_integer(QuestDiff),nl,
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

generateQuestEasy(Lvl) :- (Lvl =:= 1 ->
                            (   
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,2)),
                                asserta(monsterToKill(goblin,1)),
                                asserta(monsterToKill(wolf,1)),
                                asserta(monsterToKill(spider,0)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 slime, 1 goblin and 1 wolf'),nl,
                                generateQuestReward(3,6)
                            );
                            Lvl =:= 2 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                aasserta(monsterToKill(slime,1)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,1)),
                                asserta(monsterToKill(spider,0)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 1 slime, 2 goblin and 1 wolf'),nl,
                                generateQuestReward(5,8)
                            );
                            Lvl =:= 3 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,1)),
                                asserta(monsterToKill(spider,1)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 goblin , 1 wolf and 1 spider'),nl,
                                generateQuestReward(7,10)
                            );
                            Lvl =:= 4 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,1)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,1)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 1 goblin , 2 wolf and 1 spider'),nl,
                                generateQuestReward(9,12)
                            );
                            Lvl =:= 5 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,0)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,1)),
                                asserta(monsterToKill(zool,1)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 wolf , 1 spider and 1 zool'),nl,
                                generateQuestReward(11,14)
                            );
                            Lvl =:= 6 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,0)),
                                asserta(monsterToKill(wolf,1)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,1)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 1 wolf , 2 spider and 1 zool'),nl,
                                generateQuestReward(13,16)
                            )
                            ).

:- dynamic(generateQuestMedium/1).

generateQuestMedium(Lvl) :- (Lvl =:= 1 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,2)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,1)),
                                asserta(monsterToKill(spider,0)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 slime, 2 goblin and 1 wolf'),nl,
                                generateQuestReward(4,7)
                            );
                            Lvl =:= 2 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,1)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,0)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 1 slime, 2 goblin and 2 wolf'),nl,
                                generateQuestReward(6,9)
                            );
                            Lvl =:= 3 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,1)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 goblin , 2 wolf and 1 spider'),nl,
                                generateQuestReward(8,11)
                            );
                            Lvl =:= 4 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,1)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 1 goblin , 2 wolf and 2 spider'),nl,
                                generateQuestReward(10,13)
                            );
                            Lvl =:= 5 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,0)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,1)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 wolf , 2 spider and 1 zool'),nl,
                                generateQuestReward(12,15)
                            );
                            Lvl =:= 6 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,0)),
                                asserta(monsterToKill(wolf,1)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,2)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 1 wolf , 2 spider and 2 zool'),nl,
                                generateQuestReward(14,17)
                            )
                            ).

:- dynamic(generateQuestHard/1).

generateQuestHard(Lvl) :- (Lvl =:= 1 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,2)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,0)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 slime, 2 goblin and 2 wolf'),nl,
                                generateQuestReward(6,9)
                            );
                            Lvl =:= 2 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,3)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,0)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 3 slime, 2 goblin and 2 wolf'),nl,
                                generateQuestReward(8,11)
                            );
                            Lvl =:= 3 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,2)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 goblin , 2 wolf and 2 spider'),nl,
                                generateQuestReward(10,13)
                            );
                            Lvl =:= 4 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,3)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,0)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 3 goblin , 2 wolf and 2 spider'),nl,
                                generateQuestReward(12,15)
                            );
                            Lvl =:= 5 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,0)),
                                asserta(monsterToKill(wolf,2)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,2)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 2 wolf , 2 spider and 2 zool'),nl,
                                generateQuestReward(14,17)
                            );
                            Lvl =:= 6 ->
                            (
                                retract(isQuestActive(no)), asserta(isQuestActive(yes)),
                                asserta(monsterToKill(slime,0)),
                                asserta(monsterToKill(goblin,0)),
                                asserta(monsterToKill(wolf,3)),
                                asserta(monsterToKill(spider,2)),
                                asserta(monsterToKill(zool,2)),
                                asserta(monsterToKill(apex,0)),
                                write('Your Quest is to kill 3 wolf , 2 spider and 2 zool'),nl,
                                generateQuestReward(16,19)
                            )
                            ).

generateQuestReward(Min,Max) :- random(Min,Max,QuestReward),
                                _QuestExpReward = (QuestReward*100),
                                _QuestGoldReward = (QuestReward*150) + _Curgold.

/* Kalau Quest beres baru dapet ini, quest bisa beres dimana ajah*/
:- dynamic(updateExpAndGoldQuest/0).

updateExpAndGoldQuest :-write('Thank you for finishing the Quest, here is your reward!'), nl,
                        write('You\'ve earned '),
                        write(_QuestExpReward),
                        write(' EXP and '),
                        write(_QuestGoldReward),
                        write(' Gold from this quest'),nl,
                        gold(X,_Curgold),
                        addExp(X,_QuestExpReward),
                        _QuestGoldReward = _QuestGoldReward + _Curgold,
                        retract(gold(X,_)), asserta(gold(X,_QuestGoldReward)),
                        retract(isQuestActive(yes)), asserta(isQuestActive(no)).

exitQuest :- write('Thank you adventurer, may the odds be ever in your favor'),nl.

isQuestFinished :-  monsterToKill(slime,SlimeKill), SlimeKill < 1,
                    monsterToKill(goblin,GoblinKill), GoblinKill < 1,
                    monsterToKill(wolf,WolfKill), WolfKill < 1,
                    monsterToKill(spider,SpiderKill), SpiderKill < 1,
                    monsterToKill(zool,ZoolKill), ZoolKill < 1,
                    updateExpAndGoldQuest.

/* To Do
- Cek apakah player ada di Q (DONE)
- Cek apakah player memiliki quest yang aktif (DONE)
- Implement Progress dan finish Quest (DONE) */