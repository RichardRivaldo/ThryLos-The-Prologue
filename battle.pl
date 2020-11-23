/* battle.pl */

/* Definisi Turn Pemain */

playerTurn  :-  write('----------------------------------------------------'), nl,
                write('                It\'s your turn now!'), nl,
                write('----------------------------------------------------'), nl,
                write('[No] | [Action]'),nl,
                write('[1.] | [Attack]'),nl,
                write('[2.] | [Special Attack]'),nl,
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
                (X =< 4 -> applySpEnemy;
                applyDmgEnemy), 
                write('Ouch, that hurts! Faster, finish this fight or it will be your loss!'), nl, !.


/* Action yang dapat dilakukan oleh player */

attackActPlayer     :-  random(1, 100, C),
                        (C =< 85 ->
                         applyDmgPlayer(Damage),
                         write('You landed a blow to the enemy '), write(Damage), write(' damage!'),nl;
                         C =< 100 ->
                         write('Oh no! You miss your attack, better keep focus, soldier!')).

specialActPlayer    :-  (\+cooldown -> applySpPlayer(Dmg), !.

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
                (X > 2 -> retract(isBattle(yes)), write('OH MY GOD! You almost lost your life back then. Fortunately, you make the right move!'), nl;
                write('The enemy is too strong! But, you cannot retreat right now. Fight them!'), nl).


/* Sistem damage dalam battle */

applyDmgPlayer(Damage)  :-  attack(Username,Att), magic(Username,Mag), isEnemy(Enemy), health(Enemy,Hp), defense(Enemy,Def),
                            Damage is (Att+Mag) - (Def/2), retract(health(Enemy,Hp)),
                            NewHp is Hp - Damage, asserta(health(Enemy,NewHp)).

applyDmgEnemy(Damage)   :-  isEnemy(Enemy), attack(Enemy,Att), health(Username,Hp), defense(Username,Def),
                            Damage is Att - (Def/2), retract(health(Username,Hp)),
                            NewHp is Hp - Damage, asserta(health(Username,NewHp)).

applySpPlayer(Damage)   :-  specialattack(Username,Att), isEnemy(Enemy), health(Enemy,Hp),
                            Damage is Att, retract(health(Enemy,Hp)),
                            NewHp is Hp - Damage, asserta(health(Enemy,NewHp)).

applySpEnemy(Damage)   :-   isEnemy(Enemy), specialattack(Enemy,Att), health(Username,Hp),
                            Damage is Att, retract(health(Username,Hp)),
                            NewHp is Hp - Damage, asserta(health(Username,NewHp)).


/* Definisi Battle */

battle :-       repeat,
                    playerTurn,
                    enemyTurn,
                    (\+isBattle(yes) -> !;
                    isPlayerDead -> write('It was a pleasure to know you. But, what can I say other than goodbye?'), nl, halt;
                    isDead(X), X == yes -> retract(isBattle(_)), write('That was indeed a splendid performance! Keep it up, champ!'), nl,
                    addExp..., addGold...;
                    fail).