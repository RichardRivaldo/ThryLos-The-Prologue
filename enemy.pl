/* enemy.pl */

/* Enemy List */

isEnemy(slime).
isEnemy(goblin).
isEnemy(wolf).
isEnemy(spider).
isEnemy(zool).
isEnemy(apex).

/* Deklarasi Enemy Slime */

:- dynamic(createSlime/1).
createSlime(1) :-       asserta(enemy(slime)),
                        asserta(health(slime,7)),
                        asserta(attack(slime,2)),
                        asserta(magic(slime,3)),
                        asserta(defense(slime,4)),
                        asserta(speed(slime,3)),
                        asserta(goldEarned(slime,50)),
                        asserta(expEarned(slime,50)),
                        asserta(isDead(no)).
                        
createSlime(2) :-       asserta(enemy(slime)),
                        asserta(health(slime,9)),
                        asserta(attack(slime,4)),
                        asserta(magic(slime,5)),
                        asserta(defense(slime,6)),
                        asserta(speed(slime,5)),
                        asserta(goldEarned(slime,100)),
                        asserta(expEarned(slime,75)),
                        asserta(isDead(no)).

createSlime(3) :-       asserta(enemy(slime)),
                        asserta(health(slime,11)),
                        asserta(attack(slime,6)),
                        asserta(magic(slime,7)),
                        asserta(defense(slime,8)),
                        asserta(speed(slime,7)),
                        asserta(goldEarned(slime,150)),
                        asserta(expEarned(slime,100)),
                        asserta(isDead(no)).

/* Deklarasi Enemy Goblin */                            

:- dynamic(createGoblin/1).
createGoblin(1) :-      asserta(enemy(goblin)),
                        asserta(health(goblin,8)),
                        asserta(attack(goblin,4)),
                        asserta(magic(goblin,3)),
                        asserta(defense(goblin,6)),
                        asserta(speed(goblin,4)),
                        asserta(goldEarned(goblin,65)),
                        asserta(expEarned(goblin,60)),
                        asserta(isDead(no)).

createGoblin(2) :-      asserta(enemy(goblin)),
                        asserta(health(goblin,10)),
                        asserta(attack(goblin,6)),
                        asserta(magic(goblin,5)),
                        asserta(defense(goblin,8)),
                        asserta(speed(goblin,6)),
                        asserta(goldEarned(goblin,115)),
                        asserta(expEarned(goblin,85)),
                        asserta(isDead(no)).

createGoblin(3) :-      asserta(enemy(goblin)),
                        asserta(health(goblin,12)),
                        asserta(attack(goblin,8)),
                        asserta(magic(goblin,7)),
                        asserta(defense(goblin,10)),
                        asserta(speed(goblin,8)),
                        asserta(goldEarned(goblin,165)),
                        asserta(expEarned(goblin,110)),
                        asserta(isDead(no)).

/* Deklarasi Enemy Wolf */                            

:- dynamic(createWolf/1).
createWolf(1) :-        asserta(enemy(wolf)),
                        asserta(health(wolf,10)),
                        asserta(attack(wolf,6)),
                        asserta(magic(wolf,2)),
                        asserta(defense(wolf,5)),
                        asserta(speed(wolf,8)),
                        asserta(goldEarned(wolf,80)),
                        asserta(expEarned(wolf,70)),
                        asserta(isDead(no)).

createWolf(2) :-        asserta(enemy(wolf)),
                        asserta(health(wolf,12)),
                        asserta(attack(wolf,8)),
                        asserta(magic(wolf,4)),
                        asserta(defense(wolf,7)),
                        asserta(speed(wolf,10)),
                        asserta(goldEarned(wolf,130)),
                        asserta(expEarned(wolf,95)),
                        asserta(isDead(no)).

createWolf(3) :-        asserta(enemy(wolf)),
                        asserta(health(wolf,14)),
                        asserta(attack(wolf,10)),
                        asserta(magic(wolf,6)),
                        asserta(defense(wolf,9)),
                        asserta(speed(wolf,12)),
                        asserta(goldEarned(wolf,180)),
                        asserta(expEarned(wolf,120)),
                        asserta(isDead(no)).

/* Deklarasi Enemy Spider */                            

:- dynamic(createSpider/1).
createSpider(1) :-      asserta(enemy(spider)),
                        asserta(health(spider,12)),
                        asserta(attack(spider,7)),
                        asserta(magic(spider,4)),
                        asserta(defense(spider,6)),
                        asserta(speed(spider,6)),
                        asserta(goldEarned(spider,95)),
                        asserta(expEarned(spider,80)),
                        asserta(isDead(no)).

createSpider(2) :-      asserta(enemy(spider)),
                        asserta(health(spider,14)),
                        asserta(attack(spider,9)),
                        asserta(magic(spider,6)),
                        asserta(defense(spider,8)),
                        asserta(speed(spider,8)),
                        asserta(goldEarned(spider,145)),
                        asserta(expEarned(spider,105)),
                        asserta(isDead(no)).

createSpider(3) :-      asserta(enemy(spider)),
                        asserta(health(spider,16)),
                        asserta(attack(spider,11)),
                        asserta(magic(spider,8)),
                        asserta(defense(spider,10)),
                        asserta(speed(spider,10)),
                        asserta(goldEarned(spider,195)),
                        asserta(expEarned(spider,130)),
                        asserta(isDead(no)).                 

/* Deklarasi Enemy Zool */                            

:- dynamic(createZool/1).
createZool(1) :-        asserta(enemy(zool)),
                        asserta(health(zool,12)),
                        asserta(attack(zool,10)),
                        asserta(magic(zool,5)),
                        asserta(defense(zool,8)),
                        asserta(speed(zool,9)),
                        asserta(goldEarned(zool,110)),
                        asserta(expEarned(zool,90)),
                        asserta(isDead(no)).

createZool(2) :-        asserta(enemy(zool)),
                        asserta(health(zool,10)),
                        asserta(attack(zool,6)),
                        asserta(magic(zool,5)),
                        asserta(defense(zool,8)),
                        asserta(speed(zool,6)),
                        asserta(goldEarned(zool,160)),
                        asserta(expEarned(zool,115)),
                        asserta(isDead(no)).

createZool(3) :-        asserta(enemy(zool)),
                        asserta(health(zool,14)),
                        asserta(attack(zool,10)),
                        asserta(magic(zool,6)),
                        asserta(defense(zool,9)),
                        asserta(speed(zool,12)),
                        asserta(goldEarned(zool,210)),
                        asserta(expEarned(zool,140)),
                        asserta(isDead(no)).

createApex    :-        asserta(enemy(apex)),
                        asserta(health(apex,40)),
                        asserta(attack(apex,40)),
                        asserta(magic(apex,40)),
                        asserta(defense(apex,40)),
                        asserta(speed(apex,40)),
                        asserta(isApexDead(no)).

/* Random Generate Jenis Enemy */

generateSlime   :-          random(1, 100, X),
                            (X =< 45 -> createSlime(1);
                            X =< 75 -> createSlime(2);
                            X =< 100 -> createSlime(3)),
                            write('                                            888 d8b'),nl,
                            write('                  _                         888 Y8P'),nl,
                            write('             ____/ \\____                    888'),nl,
                            write('          __/            \\__        .d8888b 888 888 88888b.d88b.  .d88b.'),nl,
                            write('       ~-                    -~     88K     888 888 888 "888 "88bd8P  Y8b'),nl,
                            write('     /                         \\    "Y8888b.888 888 888  888  88888888888'),nl,
                            write('   ~-                           -~       X88888 888 888  888  888Y8b.'),nl,
                            write('  /                               \\  88888P`888 888 888  888  888 "Y8888'),nl,
                            write(' /      _____            _____     \\'),nl,
                            write('|         |                |        |'),nl,
                            write('|         |                |        |'),nl,
                            write('|                                   |'),nl,
                            write('|                                   |'),nl,
                            write(' \\            ---------           /'),nl,
                            write('  \\                              /'),nl,
                            write('   \\____________________________/'),nl,nl,

                            write('EPIC BATTLE! You encounter a creepy slime!'),nl,nl,

                            write('-----------Enemy Statistics-----------'), nl, nl,
                            write('Health         : '), health(slime, Health), write(Health), nl,
                            write('Attack         : '), attack(slime, Attack), write(Attack), nl,
                            write('Defense        : '), defense(slime, Defense), write(Defense), nl,
                            write('Speed          : '), speed(slime, Speed), write(Speed), nl, nl,
                            write('--------------------------------------'), nl.
                        
generateGoblin  :-          random(1, 100, X),
                            (X =< 45 -> createGoblin(1);
                            X =< 75 -> createGoblin(2);
                            X =< 100 -> createGoblin(3)),
                            write('        ,      ,                         888     888 d8b'),nl,
                            write('      / (.-""-.) \\                       888     888 Y8P'),nl,
                            write('  |\\ \\/         \\/  /|                   888     888      '),nl,
                            write('  | \\/   =.  .=  \\/  |    .d88b.  .d88b. 88888b. 888 888 88888b.'),nl,
                            write('  \\(  \\   o||o   /  )/   d88P"88bd88""88b888 "88b888 888 888 "88b'),nl,
                            write('    \\_, "-/  \\-" ,_/     888  888888  888888  888888 888 888  888'),nl,
                            write('      /   |__|   \\       Y88b 888Y88..88P888 d88P888 888 888  888'),nl,
                            write('      \\,___/\\___,/        "Y88888 "Y88P" 88888P" 888 888 888  888'),nl,
                            write('  __ _\\ \\ |uu| / /_ __        888'),nl,
                            write(' /`     \\ .--. /     `\\  Y8b d88P'),nl,
                            write('/        "----"        \\   "Y88P"'),nl,nl,

                            write('EPIC BATTLE! You encounter a stray goblin!'),nl,nl,

                            write('-----------Enemy Statistics-----------'), nl, nl,
                            write('Health         : '), health(goblin, Health), write(Health), nl,
                            write('Attack         : '), attack(goblin, Attack), write(Attack), nl,
                            write('Defense        : '), defense(goblin, Defense), write(Defense), nl,
                            write('Speed          : '), speed(goblin, Speed), write(Speed), nl, nl,
                            write('--------------------------------------'), nl.
                    
generateWolf    :-          random(1, 100, X),
                            (X =< 45 -> createWolf(1);
                            X =< 75 -> createWolf(2);
                            X =< 100 -> createWolf(3)),
                            write('                                       ,'),nl,
                            write('                                    ,,/( ,,,,,,,,,,___,,'),nl,
                            write('                                   )b     ,,,           "`,_,'),nl,
                            write('                     888  .d888   /(     /                   `,'),nl,
                            write('                     888 d88P"   L/7_/\\,|            /        \\'),nl,
                            write('                     888 888      ,`      `,  \\    ,|          \\'),nl,
                            write('888  888  888 .d88b. 888 888888    ,      /  /``````||      |\\  \\__,)))'),nl,
                            write('888  888  888d88""88b888 888             /  / |      \\    \\  \\,,,,,,/'),nl,
                            write('888  888  888888  888888 888            |  /  |       \\   )/'),nl,
                            write('Y88b 888 d88PY88..88P888 888            \\(|  )     ,,//   /'),nl,
                            write(' "Y8888888P"  "Y88P" 888 888             `_)_/     ((___/" '),nl,nl,

                            write('EPIC BATTLE! You encounter a ferocious wolf!'),nl,nl,

                            write('-----------Enemy Statistics-----------'), nl, nl,
                            write('Health         : '), health(wolf, Health), write(Health), nl,
                            write('Attack         : '), attack(wolf, Attack), write(Attack), nl,
                            write('Defense        : '), defense(wolf, Defense), write(Defense), nl,
                            write('Speed          : '), speed(wolf, Speed), write(Speed), nl, nl,
                            write('--------------------------------------'), nl.                    

generateSpider  :-          random(1, 100, X),
                            (X =< 45 -> createSpider(1);
                            X =< 75 -> createSpider(2);
                            X =< 100 -> createSpider(3)),
                            write('     ____                         ,'),nl,
                            write('    /---.`.__                ____//'),nl,
                            write('         `--.\\             //---`'),nl,
                            write('    _______  \\\\          // '),nl,
                            write('  /.------. \\ \\\\       //  ______'),nl,
                            write(' //  ___   \\ \\||/|\\  //  _/_----.\\_ '),nl,
                            write('|/  /.-.\\    \\\\|< >|// _/.`..\\  `--`                   d8b     888   '),nl,
                            write('   //   \\.\\_  \\`.|.`/ /_/ /  \\\\                        Y8P     888    '),nl,
                            write('  //     \\_  \\/" ` ~\\-`.-`    \\\\                               888             '),nl,
                            write(' //       `-._| :H: |`-.__     \\\\      .d8888b 88888b. 888 .d88888 .d88b. 888d888  '),nl,
                            write('//           (/`===`\\)`-._\\     ||     88K     888 "88b888d88" 888d8P  Y8b888P"       '),nl,
                            write('||                        \\\\     \\\\    "Y8888b.888  888888888  88888888888888         '),nl,
                            write('||                         \\\\               X88888 d88P888Y88b 888Y8b.    888  '),nl,
                            write('|/                          \\\\          88888P`88888P" 888 "Y88888 "Y8888 888     '),nl,
                            write('                             ||                888        '),nl,
                            write('                             ||                888         '),nl,
                            write('                             \\\\                888         '),nl,nl,

                            write('EPIC BATTLE! You encounter a humongous spider!'),nl,nl,

                            write('-----------Enemy Statistics-----------'), nl, nl,
                            write('Health         : '), health(spider, Health), write(Health), nl,
                            write('Attack         : '), attack(spider, Attack), write(Attack), nl,
                            write('Defense        : '), defense(spider, Defense), write(Defense), nl,
                            write('Speed          : '), speed(spider, Speed), write(Speed), nl, nl,
                            write('--------------------------------------'), nl. 

generateZool    :-          random(1, 100, X),
                            (X =< 45 -> createZool(1);
                            X =< 75 -> createZool(2);
                            X =< 100 -> createZool(3)),
                            write('                         888'),nl,
                            write('                         888'),nl,
                            write('88888888                 888         /\\______  __'),nl,
                            write('88888888 .d88b.  .d88b.  888        /-~     ,^~ / __n'),nl,
                            write('   d88P d88""88bd88""88b 888       / ,---x /_.-"L/__,\\'),nl,
                            write('  d88P  888  888888  888 888      /-".---.\\_.-`/!"  \\ \\'),nl,
                            write(' d88P   Y88..88PY88..88P 8888888  0\\/0___/   x` /    ) |'),nl,
                            write('8888     "Y88P"  "Y88P"  8888888  \\.______.-`_.{__.-"_.^'),nl,
                            write('8888888888888                      `x____,.-",-~( .-"'),nl,
                            write('8888888888888                         _.-| ,^.-~ "\\'),nl,
                            write('                                 __.-~_,-|/\\/     `i'),nl,
                            write('                                / u.-~ .-{\\/     .-^--.'),nl,
                            write('                                \\/   v~ ,-^x.____}--r |'),nl,
                            write('                                    / /"            | |'),nl,
                            write('                                  _/_/              !_l_'),nl,
                            write('                                o~_//)             (_\\\\_~o'),nl,nl,

                            write('EPIC BATTLE! You encounter a mighty zool!'),nl,nl,

                            write('-----------Enemy Statistics-----------'), nl, nl,
                            write('Health         : '), health(zool, Health), write(Health), nl,
                            write('Attack         : '), attack(zool, Attack), write(Attack), nl,
                            write('Defense        : '), defense(zool, Defense), write(Defense), nl,
                            write('Speed          : '), speed(zool, Speed), write(Speed), nl, nl,
                            write('--------------------------------------'), nl.  

generateApex    :-          createApex,
                            write('   .:\'                                  `:. '), nl, 
                            write('  ::\'                                    `::   '), nl,
                            write(' :: :.                                  .: ::  '), nl,
                            write('  `:. `:.             .             .:\'  .:\''), nl,
                            write('   `::. `::           !           ::\' .::\' '), nl,
                            write('       `::.`::.    .\' ! `.    .::\'.::\' '), nl,
                            write('         `:.  `::::\'\':!:``::::\'   ::\' '), nl,
                            write('         :\'*:::.  .:\' ! `:.  .:::*`:   '), nl,
                            write('        :: HHH::.   ` ! \'   .::HHH ::   '), nl,
                            write('       ::: `H TH::.  `!\'  .::HT H\' :::'), nl,
                            write('       ::..  `THHH:`:   :\':HHHT\'  ..::  '), nl,
                            write('       `::      `T: `. .\' :T\'      ::\'  '), nl,
                            write('         `:. .   :         :   . .:\''), nl,
                            write('           `::\'               `::\''), nl,
                            write('             :\'  .`.  .  .\'.  `: '), nl,
                            write('             :\' ::.       .:: `:  '), nl,
                            write('             :\' `:::     :::\' `: '), nl,
                            write('              `.  ``     \'\'  .\' '), nl,
                            write('               :`...........\': '), nl,
                            write('               ` :`.     .\': \''), nl,
                            write('                `:  `"""\'  :\''), nl, nl,
                            write(' ,adPPYYba, 8b,dPPYba,   ,adPPYba, 8b,     ,d8'),nl,
                            write(' ""     `Y8 88P`    "8a a8P_____88  `Y8, ,8P`'),nl,
                            write(' ,adPPPPP88 88       d8 8PP"""""""    )888('),nl,
                            write(' 88,    ,88 88b,   ,a8" "8b,   ,aa  ,d8" "8b,'),nl,
                            write(' `"8bbdP"Y8 88`YbbdP"`   `"Ybbd8"` 8P`     `Y8'),nl,
                            write('           88'),nl,
                            write('           88'),nl,nl,

                            write('FINALLY! The fate of ThryLos is in your hands!'),nl,nl,

                            write('-----------Enemy Statistics-----------'), nl, nl,
                            write('Health         : '), health(apex, Health), write(Health), nl,
                            write('Attack         : '), attack(apex, Attack), write(Attack), nl,
                            write('Defense        : '), defense(apex, Defense), write(Defense), nl,
                            write('Speed          : '), speed(apex, Speed), write(Speed), nl, nl,
                            write('--------------------------------------'), nl.          

generateEnemy(C)    :-  write('There is something in the bush. Wait, it is coming over here!'),nl,
                        zone(X),
                        ( X = 1 ->
                          random(1, 100, C),
                          ( C =< 60 -> generateSlime;
                            C =< 100 -> generateGoblin );
                          X = 2 ->
                          random(1, 100, C),
                          ( C =< 60 -> generateWolf;
                            C =< 100 -> generateSpider );
                          X = 3 ->
                          random(1, 100, C),
                          ( C =< 75 -> generateSpider;
                            C =< 100 -> generateZool ) ).

isEncounter         :-  random(1, 100, X),
                        ( X =< 70 -> 
                            write('Nothing here, keep going, young lad!');
                          X =< 100 ->
                            asserta(isBattle(yes)),
                            write('Careful! There is a chance an enemy is lurking after you...'),nl,
                            write('.'),nl,
                            write('.'),nl,
                            write('.'),nl,
                            write('.'),nl,
                            write('.'),nl,
                            write('.'),nl,
                            random(1, 100, C),
                            generateEnemy(C)).

dungeon       :-        generateApex.




    



    
    
    
    
    

    
            
 
   
     
     
    
                                
                                
   