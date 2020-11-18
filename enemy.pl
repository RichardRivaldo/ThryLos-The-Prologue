/* enemy.pl */

/* Enemy List */

isEnemy(slime).
isEnemy(goblin).
isEnemy(wolf).
isEnemy(spider).
isEnemy(zool).
isEnemy(dragon).

/* Deklarasi Enemy Slime */

:- dynamic(createSlime/2).
createSlime(slime,1) :-     asserta(enemy(slime)),
                            asserta(health(slime,7)),
                            asserta(attack(slime,2)),
                            asserta(magic(slime,3)),
                            asserta(defense(slime,4)),
                            asserta(speed(slime,3)),
                            asserta(goldEarned(slime,50)),
                            asserta(expEarned(slime,50)).
                        
createSlime(slime,2) :-     asserta(enemy(slime)),
                            asserta(health(slime,9)),
                            asserta(attack(slime,4)),
                            asserta(magic(slime,5)),
                            asserta(defense(slime,6)),
                            asserta(speed(slime,5)),
                            asserta(goldEarned(slime,100)),
                            asserta(expEarned(slime,75)).

createSlime(slime,3) :-     asserta(enemy(slime)),
                            asserta(health(slime,11)),
                            asserta(attack(slime,6)),
                            asserta(magic(slime,7)),
                            asserta(defense(slime,8)),
                            asserta(speed(slime,7)),
                            asserta(goldEarned(slime,150)),
                            asserta(expEarned(slime,100)).

/* Deklarasi Enemy Goblin */                            

:- dynamic(createGoblin/2).
createGoblin(goblin,1) :-   asserta(enemy(goblin)),
                            asserta(health(goblin,8)),
                            asserta(attack(goblin,4)),
                            asserta(magic(goblin,3)),
                            asserta(defense(goblin,6)),
                            asserta(speed(goblin,4)),
                            asserta(goldEarned(goblin,65)),
                            asserta(expEarned(goblin,60)).

createGoblin(goblin,2) :-   asserta(enemy(goblin)),
                            asserta(health(goblin,10)),
                            asserta(attack(goblin,6)),
                            asserta(magic(goblin,5)),
                            asserta(defense(goblin,8)),
                            asserta(speed(goblin,6)),
                            asserta(goldEarned(goblin,115)),
                            asserta(expEarned(goblin,85)).

createGoblin(goblin,3) :-   asserta(enemy(goblin)),
                            asserta(health(goblin,12)),
                            asserta(attack(goblin,8)),
                            asserta(magic(goblin,7)),
                            asserta(defense(goblin,10)),
                            asserta(speed(goblin,8)),
                            asserta(goldEarned(goblin,165)),
                            asserta(expEarned(goblin,110)).

/* Deklarasi Enemy Wolf */                            

:- dynamic(createWolf/2).
createWolf(wolf,1) :-       asserta(enemy(wolf)),
                            asserta(health(wolf,10)),
                            asserta(attack(wolf,6)),
                            asserta(magic(wolf,2)),
                            asserta(defense(wolf,5)),
                            asserta(speed(wolf,8)),
                            asserta(goldEarned(wolf,80)),
                            asserta(expEarned(wolf,70)).

createWolf(wolf,2) :-       asserta(enemy(wolf)),
                            asserta(health(wolf,12)),
                            asserta(attack(wolf,8)),
                            asserta(magic(wolf,4)),
                            asserta(defense(wolf,7)),
                            asserta(speed(wolf,10)),
                            asserta(goldEarned(wolf,130)),
                            asserta(expEarned(wolf,95)).

createWolf(wolf,3) :-       asserta(enemy(wolf)),
                            asserta(health(wolf,14)),
                            asserta(attack(wolf,10)),
                            asserta(magic(wolf,6)),
                            asserta(defense(wolf,9)),
                            asserta(speed(wolf,12)),
                            asserta(goldEarned(wolf,180)),
                            asserta(expEarned(wolf,120)).

/* Deklarasi Enemy Spider */                            

:- dynamic(createSpider/2).
createSpider(spider,1) :-   asserta(enemy(spider)),
                            asserta(health(spider,12)),
                            asserta(attack(spider,7)),
                            asserta(magic(spider,4)),
                            asserta(defense(spider,6)),
                            asserta(speed(spider,6)),
                            asserta(goldEarned(spider,95)),
                            asserta(expEarned(spider,80)).

createSpider(spider,2) :-   asserta(enemy(spider)),
                            asserta(health(spider,14)),
                            asserta(attack(spider,9)),
                            asserta(magic(spider,6)),
                            asserta(defense(spider,8)),
                            asserta(speed(spider,8)),
                            asserta(goldEarned(spider,145)),
                            asserta(expEarned(spider,105)).

createSpider(spider,3) :-   asserta(enemy(spider)),
                            asserta(health(spider,16)),
                            asserta(attack(spider,11)),
                            asserta(magic(spider,8)),
                            asserta(defense(spider,10)),
                            asserta(speed(spider,10)),
                            asserta(goldEarned(spider,195)),
                            asserta(expEarned(spider,130)).                 

/* Deklarasi Enemy Zool */                            

:- dynamic(createZool/2).
createZool(zool,1) :-       asserta(enemy(zool)),
                            asserta(health(zool,12)),
                            asserta(attack(zool,10)),
                            asserta(magic(zool,5)),
                            asserta(defense(zool,8)),
                            asserta(speed(zool,9)),
                            asserta(goldEarned(zool,110)),
                            asserta(expEarned(zool,90)).

createZool(zool,2) :-       asserta(enemy(zool)),
                            asserta(health(zool,10)),
                            asserta(attack(zool,6)),
                            asserta(magic(zool,5)),
                            asserta(defense(zool,8)),
                            asserta(speed(zool,6)),
                            asserta(goldEarned(zool,160)),
                            asserta(expEarned(zool,115)).

createZool(zool,3) :-       asserta(enemy(zool)),
                            asserta(health(zool,14)),
                            asserta(attack(zool,10)),
                            asserta(magic(zool,6)),
                            asserta(defense(zool,9)),
                            asserta(speed(zool,12)),
                            asserta(goldEarned(zool,210)),
                            asserta(expEarned(zool,140)).