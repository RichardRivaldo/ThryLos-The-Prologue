/* character.pl */

/* Class List */

isClass(swordsman).
isClass(knight).
isClass(archer).
isClass(hunter).
isClass(sorcerer).
isClass(magus).
isClass(assassin).
isClass(slayer).
isClass(tamer).
isClass(summoner).

/* Definisi Class Swordsman */

:- dynamic(createSwordsman/1).
createSwordsman(X) :-   asserta(class(X, swordsman)), 
                        asserta(health(X, 30)),
                        asserta(specialattack(X, 7)),
                        asserta(attack(X, 4)), 
                        asserta(magic(X, 2)), 
                        asserta(defense(X, 5)), 
                        asserta(speed(X, 2)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventSK.

/* Definisi Hidden Class Knight */

:- dynamic(createKnight/1).
createKnight(X) :-      asserta(class(X, knight)), 
                        asserta(health(X, 9)),
                        asserta(specialattack(X, 10)),
                        asserta(attack(X, 6)), 
                        asserta(magic(X, 3)), 
                        asserta(defense(X, 7)), 
                        asserta(speed(X, 3)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventSK.


/* Definisi Class Archer */

:- dynamic(createArcher/1).
createArcher(X) :-      asserta(class(X, archer)), 
                        asserta(health(X, 4)),
                        asserta(specialattack(X, 6)),
                        asserta(attack(X, 3)), 
                        asserta(magic(X, 3)), 
                        asserta(defense(X, 4)), 
                        asserta(speed(X, 7)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventAH.

/* Definisi Hidden Class Hunter */

:- dynamic(createHunter/1).
createHunter(X) :-      asserta(class(X, hunter)), 
                        asserta(health(X, 6)),
                        asserta(specialattack(X, 8)),
                        asserta(attack(X, 5)), 
                        asserta(magic(X, 4)), 
                        asserta(defense(X, 5)), 
                        asserta(speed(X, 9)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventAH.

/* Definisi Class Sorcerer */

:- dynamic(createSorcerer/1).
createSorcerer(X) :-    asserta(class(X, sorcerer)), 
                        asserta(health(X, 4)),
                        asserta(specialattack(X, 9)),
                        asserta(attack(X, 2)),
                        asserta(magic(X, 7)), 
                        asserta(defense(X, 4)), 
                        asserta(speed(X, 3)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventSM.

/* Definisi Hidden Class Magus */

:- dynamic(createMagus/1).
createMagus(X) :-       asserta(class(X, magus)), 
                        asserta(health(X, 6)),
                        asserta(specialattack(X, 11)),
                        asserta(attack(X, 3)), 
                        asserta(magic(X, 9)), 
                        asserta(defense(X, 5)), 
                        asserta(speed(X, 4)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventSM.

/* Definisi Class Assassin */

:- dynamic(createAssassin/1).
createAssassin(X) :-    asserta(class(X, assassin)), 
                        asserta(health(X, 5)),
                        asserta(specialattack(X, 9)),
                        asserta(attack(X, 6)), 
                        asserta(magic(X, 3)), 
                        asserta(defense(X, 3)), 
                        asserta(speed(X, 5)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventAS.

/* Definisi Hidden Class Slayer */

:- dynamic(createSlayer/1).
createSlayer(X) :-      asserta(class(X, slayer)), 
                        asserta(health(X, 6)),
                        asserta(specialattack(X, 12)),
                        asserta(attack(X, 8)), 
                        asserta(magic(X, 3)), 
                        asserta(defense(X, 4)), 
                        asserta(speed(X, 6)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventAS.

/* Definisi Class Tamer */

:- dynamic(createTamer/1).
createTamer(X) :-       asserta(class(X, tamer)), 
                        asserta(health(X, 5)),
                        asserta(specialattack(X, 6)),
                        asserta(attack(X, 3)), 
                        asserta(magic(X, 3)), 
                        asserta(defense(X, 5)), 
                        asserta(speed(X, 4)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventTS.

/* Definisi Hidden Class Summoner */

:- dynamic(createSummoner/1).
createSummoner(X) :-    asserta(class(X, summoner)), 
                        asserta(health(X, 6)),
                        asserta(specialattack(X, 9)),
                        asserta(attack(X, 5)), 
                        asserta(magic(X, 5)), 
                        asserta(defense(X, 7)), 
                        asserta(speed(X, 4)),
                        asserta(gold(X, 100)),
                        asserta(exp(X, 0)),
                        asserta(level(X, 1)),
                        initInventTS.


/* Definisi Random Hidden Class Generator */

surprise(Username) :-   random(1, 6, X),
                        (X = 1 -> createKnight(Username),
                        write('      _,.'), nl,
                        write('    ,` -.)'), nl,
                        write('   ( _/-\\\\-._'), nl,
                        write('  /,|`--._,-^|            , ---------------------------------'), nl,
                        write('  \\_| |`-._/||          ,\'|     FOR THE KING AND COUNTRY!'), nl,
                        write('    |  `-, / |         /  / ---------------------------------'), nl,
                        write('    |     || |        /  /'), nl,
                        write('     `r-._||/   __   /  /'), nl,
                        write(' __,-<_     )`-/  `./  /'), nl,
                        write('\'  \\   `---\' \\     /  /'), nl,
                        write('    |           |./  /'), nl,
                        write('    /           //  /'), nl,
                        write('\\_/\' \\         |/  /'), nl,
                        write(' |    |   _,^-\'/  /'), nl,
                        write(' |    , ``  (\\/  /_'), nl,
                        write('  \\,.->._    \\X-=/^'), nl,
                        write('  (  /   `-._//^`'), nl,
                        write('   `Y-.____(__}'), nl,
                        write('    |    -.{__)'), nl, nl,
                        write('Hidden Class Unlocked: You are now a Knight!'), nl;

                        X = 2 -> createHunter(Username),
                        write('    ----------------------------------                  |'), nl,
                        write('             I AM THE HUNTER                             \\.'), nl,
                        write('    ----------------------------------                   /|.'), nl,
                        write('                                                      /  `|.'), nl,
                        write('                                                    /     |.'), nl,
                        write('                                                  /       |.'), nl,
                        write('                                                /         `|.'), nl,
                        write('                                              /            |.'), nl,
                        write('                                            /              |.'), nl,
                        write('                                          /                |.'), nl,
                        write('     __                                 /                  `|.'), nl,
                        write('      -\\                              /                     |.'), nl,
                        write('        \\\\                          /                       |.'), nl,
                        write('          \\\\                      /                         |.'), nl,
                        write('           \\|                   /                           |\\'), nl,
                        write('             \\#####\\          /                             ||'), nl,
                        write('         ==###########>     /                               ||'), nl,
                        write('          \\##==      \\    /                                 ||'), nl,
                        write('     ______ =       =|__/___                                ||'), nl,
                        write(' ,--\' ,----`-,__ ___/\'  --,-`-==============================##==========>'), nl,
                        write('\\               \'        ##_______ ______   ______,--,____,=##,__'), nl,
                        write(' `,    __==    ___,-,__,--\'#\'  ===\'      `-\'              | ##,-/'), nl,
                        write('   `-,____,---\'       \\####\\              |        ____,--\\_##,/'), nl,
                        write('       #_              |##   \\  _____,---==,__,---\'         ##'), nl,
                        write('        #              ]===--==\\                            ||'), nl,
                        write('        #,             ]         \\                          ||'), nl,
                        write('         #_            |           \\                        ||'), nl,
                        write('          ##_       __/\'             \\                      ||'), nl,
                        write('           ####=\'     |                \\                    |/'), nl,
                        write('            ###       |                  \\                  |.'), nl,
                        write('            ##       _\'                    \\                |.'), nl,
                        write('           ###=======]                       \\              |.'), nl,
                        write('          ///        |                         \\           ,|.'), nl,
                        write('          //         |                           \\         |.'), nl,
                        write('                                                   \\      ,|.'), nl,
                        write('                                                     \\    |.'), nl,
                        write('                                                       \\  |.'), nl,
                        write('                                                         \\|.'), nl,
                        write('                                                         /.'), nl,
                        write('                                                        |'), nl, nl,

                        write('Hidden Class Unlocked: You are now a Hunter!'), nl;

                        X = 3 -> createMagus(Username),
                        write('         ----------------         ....'), nl,
                        write('              LUCIO!             .\'\' .\'\'\''), nl,
                        write('.        ----------------     .\'   :'), nl,
                        write('\\\\                          .:    :'), nl,
                        write(' \\\\                        _:    :       ..----.._'), nl,
                        write('  \\\\                    .:::.....:::.. .\'         \'\'.'), nl,
                        write('   \\\\                 .\'  #-. .-######\'     #        \'.'), nl,
                        write('    \\\\                 \'.##\'/ \' ################       :'), nl,
                        write('     \\\\                  #####################         :'), nl,
                        write('      \\\\               ..##.-.#### .\'\'\'\'###\'.._        :'), nl,
                        write('       \\\\             :--:########:            \'.    .\' :'), nl,
                        write('        \\\\..__...--.. :--:#######.\'   \'.         \'.     :'), nl,
                        write('        :     :  : : \'\':\'-:\'\':\'::        .         \'.  .\''), nl,
                        write('        \'---\'\'\'..: :    \':    \'..\'\'\'.      \'.        :\''), nl,
                        write('           \\\\  :: : :     \'      \'\'\'\'\'\'.     \'.      .:'), nl,
                        write('            \\\\ ::  : :     \'            \'.      \'      :'), nl,
                        write('             \\\\::   : :           ....\' ..:       \'     \'.'), nl,
                        write('              \\\\::  : :    .....####\\\\ .~~.:.             :'), nl,
                        write('               \\\\\':.:.:.:\'#########.===. ~ |.\'-.   . \'\'\'.. :'), nl,
                        write('                \\\\    .\'  ########## \\ \\ _.\' \'. \'-.       \'\'\'.'), nl,
                        write('                :\\\\  :     ########   \\ \\      \'.  \'-.        :'), nl,
                        write('               :  \\\\\'    \'   #### :    \\ \\      :.    \'-.      :'), nl,
                        write('              :  .\'\\\\   :\'  :     :     \\ \\       :      \'-.    :'), nl,
                        write('             : .\'  .\\\\  \'  :      :     :\\ \\       :        \'.   :'), nl,
                        write('             ::   :  \\\\\'  :.      :     : \\ \\      :          \'. :'), nl,
                        write('             ::. :    \\\\  : :      :    ;  \\ \\     :           \'.:'), nl,
                        write('              : \':    \'\\\\ :  :     :     :  \\:\\     :        ..\''), nl,
                        write('                 :    \' \\\\ :        :     ;  \\|      :   .\'\'\''), nl,
                        write('                 \'.   \'  \\\\:                         :.\'\''), nl,
                        write('                  .:..... \\\\:       :            ..\'\''), nl,
                        write('                  .:..... \\\\:       :            ..\'\''), nl,
                        write('                            \\\\'), nl, nl,

                        write('Hidden Class Unlocked: You are now a Magus!'), nl;

                        X = 4 -> createSlayer(Username),
                        write('                                         .""--..__'), nl,
                        write('                     _                     []       ``-.._'), nl,
                        write('                  .\'` `\'.                  ||__           `-._'), nl,
                        write('                 /    ,-.\\                 ||_ ```---..__     `-.'), nl,
                        write('                /    /:::\\\\               /|//}          ``--._  `.'), nl,
                        write('                |    |:::||              |////}                `-. \''), nl,
                        write('                |    |:::||             //\'///                    `.\''), nl,
                        write('                |    |:::||            //  ||\'                      `|'), nl,
                        write('                /    |:::|/        _,-//\\  ||'), nl,
                        write('               /`    |:::|`-,__,-\'`  |/  \\ ||'), nl,
                        write('             /`  |   |\'\' ||           \\   |||'), nl, 
                        write('           /`    \\   |   ||            |  /||'), nl,
                        write('         |`       |  |   |)            \\ | ||'), nl,
                        write('        |          \\ |   /      ,.__    \\| ||'), nl,
                        write('        /           `         /`    `\\   | ||'), nl,
                        write('       |                     /        \\  / ||'), nl,
                        write('       |                     |        | /  ||'), nl,
                        write('       /         /           |        `(   ||'), nl,
                        write('      /          .           /          )  ||'), nl,
                        write('     |            \\          |     ________||'), nl,
                        write('    /             |          /     `-------.|'), nl,
                        write('   |\\            /          |              ||'), nl,
                        write('   \\/`-._       |           /              ||'),nl,
                        write('    //   `.    /`           |              ||'), nl,
                        write('   //`.    `. |             \\              ||'), nl,
                        write('  ///\\ `-._  )/             |              ||'), nl,
                        write(' //// )   .(/               |              ||'), nl,
                        write(' ||||   ,\'` )               /              //'), nl,
                        write(' ||||  /                    /             || '), nl,
                        write(' `\\\\` /`                    |             // '), nl,
                        write('     |`                     \\            ||  '), nl,
                        write('    /                        |           // '), nl,
                        write('  /`                          \\         // '), nl,
                        write('/`                            |        ||  '), nl,
                        write('`-.___,-.      .-.        ___,\'        (/  '), nl, nl,

                        write('Hidden Class Unlocked: You are now a Slayer!'), nl;

                        createSummoner(Username),
                        write('                                        ,   ,'), nl,
                        write('     ----------------------             $,  $,     ,'), nl,
                        write('               D                        "ss.$ss. .s\''), nl,
                        write('               R                ,     .ss$$$$$$$$$$s,'), nl,
                        write('               A                $. s$$$$$$$$$$$$$$`$$Ss'), nl,
                        write('               G                "$$$$$$$$$$$$$$$$$$o$$$       ,'), nl,
                        write('               O               s$$$$$$$$$$$$$$$$$$$$$$$$s,  ,s'), nl,
                        write('               N              s$$$$$$$$$"$$$$$$""""$$$$$$"$$$$$,'), nl,
                        write('               S              s$$$$$$$$$$s""$$$$ssssss"$$$$$$$$"'), nl,
                        write('                             s$$$$$$$$$$\'         `"""ss"$"$s""'), nl,
                        write('               L             s$$$$$$$$$$,              `"""""$  .s$$s'), nl,
                        write('               I             s$$$$$$$$$$$$s,...               `s$$\'  `'), nl,
                        write('               K         `ssss$$$$$$$$$$$$$$$$$$$$####s.     .$$"$.   , s-'), nl,
                        write('               E           `""""$$$$$$$$$$$$$$$$$$$$#####$$$$$$"     $.$\''), nl,
                        write('                                 "$$$$$$$$$$$$$$$$$$$$$####s""     .$$$|'), nl,
                        write('               M                   "$$$$$$$$$$$$$$$$$$$$$$$$##s    .$$" $'), nl,
                        write('               E                   $$""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   `'), nl,
                        write('     ----------------------        $$"  "$"$$$$$$$$$$$$$$$$$$$$S""""\''), nl,
                        write('                             ,   ,"     \'  $$$$$$$$$$$$$$$$####s'), nl,
                        write('                             $.          .s$$$$$$$$$$$$$$$$$####"'), nl,
                        write('                 ,           "$s.   ..ssS$$$$$$$$$$$$$$$$$$$####"'), nl,
                        write('                 $           .$$$S$$$$$$$$$$$$$$$$$$$$$$$$#####"'), nl,
                        write('                 Ss     ..sS$$$$$$$$$$$$$$$$$$$$$$$$$$$######""'), nl,
                        write('                  "$$sS$$$$$$$$$$$$$$$$$$$$$$$$$$$########"'), nl,
                        write('           ,      s$$$$$$$$$$$$$$$$$$$$$$$$#########""\''), nl,
                        write('           $    s$$$$$$$$$$$$$$$$$$$$$#######""\'      s\''), nl,
                        write('           $$..$$$$$$$$$$$$$$$$$$######"\'       ....,$$....    ,$'), nl,
                        write('            "$$$$$$$$$$$$$$$######"\' ,     .sS$$$$$$$$$$$$$$$$s$$'),nl,
                        write('              $$$$$$$$$$$$#####"     $, .s$$$$$$$$$$$$$$$$$$$$$$$$s.'), nl,
                        write('   )          $$$$$$$$$$$#####\'      `$$$$$$$$$###########$$$$$$$$$$$.'), nl,
                        write('  ((          $$$$$$$$$$$#####       $$$$$$$$###"       "####$$$$$$$$$$'), nl,
                        write('  ) \\         $$$$$$$$$$$$####.     $$$$$$###"             "###$$$$$$$$$   s\''), nl,
                        write(' (   )        $$$$$$$$$$$$$####.   $$$$$###"                ####$$$$$$$$s$$\''), nl,
                        write(' )  ( (       $$"$$$$$$$$$$$#####.$$$$$###\'                .###$$$$$$$$$$"'), nl,
                        write(' (  )  )   _,$"   $$$$$$$$$$$$######.$$##\'                .###$$$$$$$$$$'), nl,
                        write(' ) (  ( \\.         "$$$$$$$$$$$$$#######,,,.          ..####$$$$$$$$$$$"'), nl,
                        write('(   )$ )  )        ,$$$$$$$$$$$$$$$$$$####################$$$$$$$$$$$"'), nl,
                        write('(   ($$  ( \\     _sS"  `"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$S$$,'), nl,
                        write(' )  )$$$s ) )  .      .   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"\'  `$$'), nl,
                        write('  (   $$$Ss/  .$,    .$,,s$$$$$$##S$$$$$$$$$$$$$$$$$$$$$$$$S""        \''), nl,
                        write('    \\)_$$$$$$$$$$$$$$$$$$$$$$$##"  $$        `$$.        `$$.'), nl,
                        write('        `"S$$$$$$$$$$$$$$$$$#"      $          `$          `$ '), nl,
                        write('            `"""""""""""""\'         \'           \'           \''), nl, nl,

                        write('Hidden Class Unlocked: You are now a Summoner!'), nl).

/* Definisi Check Stats */

checkStats(Username) :- write('   ___ _                         __ _        _       '), nl,
                        write('  / _ \\ | __ _ _   _  ___ _ __  / _\\ |_ __ _| |_ ___ '), nl,
                        write(' / /_)/ |/ _` | | | |/ _ \\ \'__| \\ \\| __/ _` | __/ __|'), nl,
                        write('/ ___/| | (_| | |_| |  __/ |    _\\ \\ || (_| | |_\\__ \\'), nl,
                        write('\\/    |_|\\__,_|\\__, |\\___|_|    \\__/\\__\\__,_|\\__|___/'), nl,
                        write('               |___/'), nl, nl,

                        write('---------Personal Information---------'), nl, nl,
                        write('Username       : '), write(Username), nl,
                        write('Class          : '), class(Username, Class), write(Class), nl,
                        write('Level          : '), 
                        (level(Username, 6), write('MAX LEVEL!'), nl;
                        level(Username, Level), Level =\= 6, write(Level), nl),
                        write('EXP            : '), exp(Username, EXP), write(EXP), nl,
                        write('Gold           : '), gold(Username, Gold), write(Gold), nl, nl,

                        write('----------Player Statistics----------'), nl, nl,
                        write('Health         : '), health(Username, Health), write(Health), nl,
                        write('Attack         : '), attack(Username, Attack), write(Attack), nl,
                        write('Special Attack : '), specialattack(Username, SpAttack), write(SpAttack), nl,
                        write('Magic          : '), magic(Username, Magic), write(Magic), nl,
                        write('Defense        : '), defense(Username, Defense), write(Defense), nl,
                        write('Speed          : '), speed(Username, Speed), write(Speed), nl, nl,
                        checkEquip.

/* Definisi Check Inventory */

inventory :-            write('  _____                      _                   '), nl,
                        write('  \\_   \\_ ____   _____ _ __ | |_ ___  _ __ _   _ '), nl,
                        write('   / /\\/ \'_ \\ \\ / / _ \\ \'_ \\| __/ _ \\| \'__| | | |'), nl,
                        write('/\\/ /_ | | | \\ V /  __/ | | | || (_) | |  | |_| |'), nl,
                        write('\\____/ |_| |_|\\_/ \\___|_| |_|\\__\\___/|_|   \\__, |'), nl,
                        write('                                           |___/ '), nl, nl,

                        write('Inventory States: '), inventory(X), write(X), write('/'), write('100.'), nl, nl,

                        write('------------------LIST------------------'), nl, nl,
                        forall((isInInvent(Item)), 
                        (countItem(Item, Count), write(Item), write(' : '), write(Count), nl)), nl.
                        
/* Definisi Check Equipment */

checkEquip :-           write('--------------Equipments--------------'), nl, nl,
                        write('Weapon         : |'), eqWeapon(X), write(X), write('|'), nl,
                        write('Armor          : |'), eqArmor(Y), write(Y), write('|'), nl, 
                        write('Accessory      : |'), eqAccessory(Z), write(Z), write('|'), nl, nl.
