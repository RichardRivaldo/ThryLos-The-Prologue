/* battle.pl */

/* Definisi Turn Pemain */

playerTurn  :-  write('----------------------------------------------------'), nl,
                write('                It\'s your turn now!'), nl,
                write('----------------------------------------------------'), nl,
                write('                     PLAYER INFO                    '), nl,
                write('Health   : '), class(Username,_), health(Username, Health), write(Health),nl,
                write('Attack   : '), attack(Username, Attack), write(Attack), nl,
                write('Magic    : '), magic(Username, Magic), write(Magic), nl,
                write('Defense  : '), defense(Username, Defense), write(Defense), nl,
                write('Speed    : '), speed(Username, Speed), write(Speed), nl,
                write('----------------------------------------------------'), nl,
                write('                      ENEMY INFO                    '), nl,
                write('Health   : '), enemy(Enemy), health(Enemy, Health2), write(Health2),nl,
                write('Attack   : '), attack(Enemy, Attack2), write(Attack2), nl,
                write('Defense  : '), defense(Enemy, Defense2), write(Defense2), nl,
                write('Speed    : '), speed(Enemy, Speed2), write(Speed2), nl,
                write('----------------------------------------------------'), nl,
                write('[No] | [Action]'),nl,
                write('[1.] | [Attack]'),nl,
                
                spcooldown(X), (X=<0->
                write('[2.] | [Special Attack]                      READY');
                write('[2.] | [Special Attack]          cooldown :'),
                write(X), write('turn(s) left')),
                nl,
                write('[3.] | [Use Potion]'),nl,
                write('[4.] | [Run]'),nl,
                write('----------------------------------------------------'), nl,
                write('                  What will you do?'), nl,
                write('----------------------------------------------------'), nl,
                write('Pick your action : '), read_integer(BattleChoice),
                (BattleChoice = 1 -> attackActPlayer;
                 BattleChoice = 2 -> specialActPlayer;
                 BattleChoice = 3 -> drinkAct;
                 BattleChoice = 4 -> runAct;
                 write('Focus on what is in front of you right now! Don\'t try to run away!'), nl).

/* Definisi Turn Enemy */

enemyTurn :-    write('----------------------------------------------------'), nl,
                write('          PREPARE YOURSELF FROM THE ATTACK!'), nl,
                write('----------------------------------------------------'), nl, nl,
                random(1,11,X),
                (X =< 4 -> applySpEnemy(_);
                applyDmgEnemy(_)), 
                write('Ouch, that hurts! Faster, finish this fight or it will be your loss!'), nl, nl, !.


/* Action yang dapat dilakukan oleh player */

attackActPlayer     :-  random(1, 100, C),
                        (C =< 85 ->
                         applyDmgPlayer(Damage),
                         write('You landed a blow to the enemy '), write(Damage), write(' damage!'),nl;
                         C =< 100 ->
                         write('Oh no! You miss your attack, better keep focus, soldier!')), nl.

specialActPlayer    :-  spcooldown(X),
                        X=<0 -> applySpPlayer(_), !;
                        write('Oh no! You\'re still cannot use your special attack!'),nl,
                        write('Your enemy laughs at you over your exhaustion! You lost your turn!'), updateCD.

drinkAct    :-  write('----------------------------------------------------'), nl,
                write('   Gotta make the best use of that potions, mate!'), nl,
                write('----------------------------------------------------'), nl,
                write('[No] | [Potion]'),nl,
                write('[1.] | [Health Potion]'),nl,
                write('[2.] | [Attack Potion]'),nl,
                write('[3.] | [Defense Potion]'),nl,
                write('[4.] | [Magic Potion]'),nl,
                write('[5.] | [Speed Potion]'),nl,
                write('----------------------------------------------------'), nl,
                write('          Now, which juice will you drink?'), nl,
                write('----------------------------------------------------'), nl,
                write('Pick a potion : '), read_integer(PotionChoice),
                (PotionChoice = 1 -> drink(health_potion);
                 PotionChoice = 2 -> drink(attack_potion);
                 PotionChoice = 3 -> drink(defense_potion);
                 PotionChoice = 4 -> drink(magic_potion);
                 PotionChoice = 5 -> drink(speed_potion)).

runAct      :-  random(1, 11, X),
                (
                    X > 0 ->
                    retract(isBattle(_)), write('OH MY GOD! You almost lost your life back then. Fortunately, you make the right move!'), nl,
                    retract(enemy(Enemy)),
                    retract(health(Enemy,_)),
                    retract(attack(Enemy,_)),
                    retract(specialattack(Enemy,_)),
                    retract(defense(Enemy,_)),
                    retract(speed(Enemy,_)),
                    retract(goldEarned(Enemy,_)),
                    retract(expEarned(Enemy,_))
                    ;
                    write('The enemy is too strong! But, you cannot retreat right now. Fight them!'), nl
                ).


/* Sistem damage dalam battle */

updateCD                :-  spcooldown(X), NewX is X-1, 
                            (NewX < 0 ->
                                write('----------------------------------------------------'), nl,
                                write('---------YOUR SPECIAL ATTACK IS READY!--------------'), nl,
                                write('----------------------------------------------------'), nl
                            ;
                                retract(spcooldown(X)),
                                asserta(spcooldown(NewX))
                            ).

resetCD                 :- write('You got tired from using your hidden moves!!'),spcooldown(_), retract(spcooldown(_)), asserta(spcooldown(3)).

applyDmgPlayer(Damage)  :-  class(Username,_), attack(Username,Att), magic(Username,Mag), enemy(Enemy), health(Enemy,Hp), defense(Enemy,Def),
                            Damage is (Att+Mag) - (Def/2), retract(health(Enemy,Hp)),
                            updateCD,
                            NewHp is Hp - Damage, asserta(health(Enemy,NewHp)).

applyDmgEnemy(Damage)   :-  class(Username,_), enemy(Enemy), attack(Enemy,Att), health(Username,Hp), defense(Username,Def),
                            Damage is Att - (Def/2), retract(health(Username,Hp)),
                            NewHp is Hp - Damage, asserta(health(Username,NewHp)),
                            write('Are you ok? You left with '), write(NewHp), write('HP left!'), nl.

applySpPlayer(Damage)   :-  class(Username,_), specialattack(Username,Att), enemy(Enemy), health(Enemy,Hp),
                            Damage is Att, retract(health(Enemy,Hp)),
                            write('You use your hidden move!! You dealt '), write(Att), write(' damages!'),nl,
                            resetCD,
                            NewHp is Hp - Damage, asserta(health(Enemy,NewHp)).

applySpEnemy(Damage)    :-  class(Username,_), enemy(Enemy), specialattack(Enemy,Att), health(Username,Hp),
                            Damage is Att, retract(health(Username,Hp)),
                            NewHp is Hp - Damage, asserta(health(Username,NewHp)),
                            write('Whoa! That was a huge blow! You left with '), write(NewHp), write('HP left!'), nl.

/* Definisi Battle */

battle :-       
            class(Username,_), enemy(Enemy), speed(Enemy,ESpeed), speed(Username,PSpeed),
            repeat,
                (PSpeed>ESpeed ->
                    playerTurn,
                    (isEnemyDead -> winningBattle; enemyTurn)
                ;
                    (isEnemyDead -> winningBattle; enemyTurn),
                    (isPlayerDead ->
                        write('It was a pleasure to know you. But, what can I say other than goodbye?'),
                        nl, halt
                        ; playerTurn)
                ),
                isEnemyDead -> winningBattle,
                (\+isBattle(yes) -> !;
                isPlayerDead -> write('It was a pleasure to know you. But, what can I say other than goodbye?'), nl, halt;
                fail).

addGold(X,Add)  :-  gold(X,PrevGold), retract(gold(X,PrevGold)),
                    NewGold is PrevGold + Add, asserta(gold(X,NewGold)),
                    write('Cha ching! The monsters drop some money!'),nl.  

winningBattle :-  
                  /*monsterToKill(Enemy,Tot),
                  retract(monsterToKill(Enemy,_)), asserta(monsterToKill(Enemy,Tot-1)),
                  isQuestFinished,*/
                    retract(isBattle(_)), write('That was indeed a splendid performance! Keep it up, champ!'), nl,
                    enemy(Enemy), expEarned(Enemy,Exp), goldEarned(Enemy,Gold), addExp(Username,Exp), addGold(Username,Gold),
                    retract(enemy(Enemy)),
                    retract(health(Enemy,_)),
                    retract(attack(Enemy,_)),
                    retract(specialattack(Enemy,_)),
                    retract(defense(Enemy,_)),
                    retract(speed(Enemy,_)),
                    retract(goldEarned(Enemy,_)),
                    retract(expEarned(Enemy,_)).