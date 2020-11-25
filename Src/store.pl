/* store.pl */

/* Definisi store */

visitStore  :-  write('Welcome to the shop adventurer!'), nl,
                write('what can i help you with?'),nl,

                write('|--------------------------------------|'),nl,
                write('|          Welcome To The Shop         |'),nl,
                write('|--------------------------------------|'),nl,nl,
                write('What will you do?'),nl,
                write('[1]. I want to buy some potions!'),nl,
                write('[2]. I\'m feeling good, let\'s catch some luck!'),nl,
                write('[0]. Nah, I\'m just wandering around!'),nl,

                gold(_,Balance),
                write('Your current money : '),write(Balance),nl,
                write('Pick an option : '), read_integer(ShopChoice),nl,

                (ShopChoice = 1 -> 
                    write('Sure, what potion are you looking for?'),nl,

                    write('|--------------------------------------|'),nl,
                    write('|             Potion Shop              |'),nl,
                    write('|--------------------------------------|'),nl,
                    write('| [No] | [Potion Name]     | [Price]   |'),nl,
                    write('| [1.] | Health Potion     | 50        |'),nl,
                    write('| [2.] | Attack Potion     | 75        |'),nl,
                    write('| [3.] | Defense Potion    | 50        |'),nl,
                    write('| [4.] | Magic Potion      | 100       |'),nl,
                    write('| [5.] | Speed Potion      | 50        |'),nl,
                    write('|                                      |'),nl,
                    write('| 0. Cancel                            |'),nl,
                    write('|--------------------------------------|'),nl,

                    write('Sure, what potion are you looking for?'),nl,

                    read_integer(PotionChoice),nl,

                    (
                        PotionChoice = 1 ->
                        (
                            Balance >= 50 ->
                                NewBalance is Balance-50,
                                updateGold(NewBalance),
                                saveItem(health_potion),
                                write('Wish you healthy life!'),nl
                            ;unsufficientGold
                        );
                        PotionChoice = 2 ->
                        (
                            Balance >= 75 ->
                                NewBalance is Balance-75,
                                updateGold(NewBalance),
                                saveItem(attack_potion),
                                write('Stay strong warrior!'),nl
                            ;unsufficientGold
                        );
                        PotionChoice = 3 ->
                        (
                           Balance >= 50 ->
                                NewBalance is Balance-50,
                                updateGold(NewBalance),
                                saveItem(defense_potion),
                                write('Nice pick! You won\'t get injured!'),nl
                            ;unsufficientGold
                        );
                        PotionChoice = 4 ->
                        (
                            Balance >= 100 ->
                                NewBalance is Balance-100,
                                updateGold(NewBalance),
                                saveItem(magic_potion),
                                write('You sure have some magic trick to pull!'),nl
                                ;unsufficientGold
                        );
                        PotionChoice = 5 ->
                        (
                            Balance >= 50 ->
                                NewBalance is Balance-50,
                                updateGold(NewBalance),
                                saveItem(speed_potion),
                                write('Now you\'re the flash! Don\'t forget to pay tho!'),nl
                                ;unsufficientGold
                        );
                        PotionChoice = 0 ->
                        (
                            exitMessage   
                        )
                    );
                ShopChoice = 2 ->
                    write('Hoho! You got some guts huh? Let\'s see how lucky you are!'),nl,

                    write('|---------------------------------------------------------------------|'),nl,
                    write('|                            GACHA MACHINE                            |'),nl,
                    write('|---------------------------------------------------------------------|'),nl,
                    write('| [No] | [Gacha Machine]                                   | [Price]  |'),nl,
                    write('|                                                          |          |'),nl,
                    write('| [1.] | Standard                                          |     50   |'),nl,
                    write('|        67% ghost grade, 18% demon grade, 9% mamon grade  |          |'),nl,
                    write('|        5% lucifer grade, 1% god grade                    |          |'),nl,
                    write('|                                                          |          |'),nl,
                    write('| [2.] | Silver                                            |    100   |'),nl,
                    write('|        43% ghost grade, 27% demon grade, 18% mamon grade |          |'),nl,
                    write('|        10% lucifer grade, 2% god grade                   |          |'),nl,
                    write('|                                                          |          |'),nl,
                    write('| [3.] | Gold                                              |    200   |'),nl,
                    write('|        18% ghost grade, 35% demon grade, 27% mamon grade |          |'),nl,
                    write('|        15% lucifer grade, 5% god grade                   |          |'),nl,
                    write('|                                                          |          |'),nl,
                    write('| [4.] | Gambler                                           |    200   |'),nl,
                    write('|        50% zonk                                          |          |'),nl,
                    write('|        35% mamon grade, 15% god grade                    |          |'),nl,
                    write('|                                                          |          |'),nl,
                    write('| 0. Cancel                                                |          |'),nl,
                    write('|---------------------------------------------------------------------|'),nl,

                    read_integer(GachaChoice),nl,
					random(1,100,R),
                    (
                        GachaChoice = 1 ->
                        (
                            Balance>=50 ->
                                NewBalance is Balance-50,
                                updateGold(NewBalance),
                                getGachaResultStandard(R)
                                ;unsufficientGold
                        );
                        GachaChoice = 2 ->
                        (
                            Balance>=100 ->
                                NewBalance is Balance-100,
                                updateGold(NewBalance),
                                getGachaResultSilver(R)
                                ;unsufficientGold
                        );
                        GachaChoice = 3 ->
                        (
                            Balance>=200 ->
                                NewBalance is Balance-200,
                                updateGold(NewBalance),
                                getGachaResultGold(R)
                                ;unsufficientGold
                        );
                        GachaChoice = 4 ->
                        (
                             Balance>=200 ->
                                NewBalance is Balance-200,
                                updateGold(NewBalance),
                                getGachaResultGambler(R)
                                ;unsufficientGold
                        );
                        GachaChoice = 0 ->
                        (
                            exitMessage
                        )
                    );
                ShopChoice = 0 -> exitMessage
                ),

                write('Hope you are satisfied with your luck!'),nl,
                write('See you later!').

updateGold(NewBalance):-
    retract(gold(X,_)), asserta(gold(X,NewBalance)).

unsufficientGold :-
    write('I\'m sorry! It seems that you don\'t have enough money, I can\'t give you that!'),nl.

/* Definisi gacha standar */

getGachaResultStandard(R):-
    write('Congrats on winning your gacha!'),nl,
    (
        R =< 67 ->randomGhostGrade;
        R =< 85 ->randomDemonGrade;
        R =< 94 ->randomMamonGrade;
        R =< 99 ->randomLuciferGrade;
        R =< 100 -> randomGodGrade
    ).

/* Definisi gacha Silver */

getGachaResultSilver(R):-
    write('Congrats on winning your gacha!'),nl,
    (
        R =< 43 ->randomGhostGrade;
        R =< 70 ->randomDemonGrade;
        R =< 88 ->randomMamonGrade;
        R =< 98 ->randomLuciferGrade;
        R =< 100 -> randomGodGrade
    ).

/* Definisi gacha Gold */

getGachaResultGold(R):-
    write('Congrats on winning your gacha!'),nl,
    (
        R =< 18 ->randomGhostGrade;
        R =< 53 ->randomDemonGrade;
        R =< 80 ->randomMamonGrade;
        R =< 95 ->randomLuciferGrade;
        R =< 100 -> randomGodGrade
    ).

/* Definisi gacha gambler */

getGachaResultGambler(R):-
    write('Congrats on winning your gacha!'),nl,
    (
        R =< 50 ->write('Sorry you didn\'t get anything! Better luck next time!'),nl;
        R =< 85 ->randomMamonGrade;
        R =< 100 -> randomGodGrade
    ).

/* Definisi random untuk ghost grade */

randomGhostGrade:-
    choose([iron_sword, slow_bow, neutral_wand, dull_knife, rockhard_leash, kavacha, brynhildr],A),nl,
    write('Item Name : '),write(A),nl,
    write('Grade     : Ghost'),nl,
    saveItem(A).

/* Definisi random untuk demon grade */

randomDemonGrade:-
    choose([platinum_sword, agile_bow, dark_wand, sharp_knife, cotton_leash, aegis, ragnar], A),nl,
    write('Item Name : '),write(A),nl,
    write('Grade     : Demon'),nl,
    saveItem(A).

/* Definisi random untuk mamon grade */

randomMamonGrade:-
    choose([adamantite_sword, flash_bow, bright_wand, deadly_knife, sutra_leash, wukong, harmonia], A),nl,
    write('Item Name : '),write(A),nl,
    write('Grade     : Mamon'),nl,
    saveItem(A).

/* Definisi random untuk lucifer grade */

randomLuciferGrade:-
    choose([mikazuki, achilles, tarot, ezio, lung, diomedes, amaterasu], A),nl,
    write('Item Name : '),write(A),nl,
    write('Grade     : Lucifer'),nl,
    saveItem(A).

/* Definisi random untuk god grade */

randomGodGrade:-
    choose([exCalibur, apollo, odyssey, scythe, ouroboros, beowulf, theseus], A),nl,
    write('Item Name : '),write(A),nl,
    write('Grade     : God'),nl,
    saveItem(A).

/* Definisi random untuk mengambil elemen dari list secara acak */

choose([],[]).
choose(List, Elt):-
    length(List, Length),
    random(0, Length, Index),
    nth0(Index,List,Elt).   

/* Definisi pengecut */

exitMessage :-
    write('Still not sure? That\'s ok! Come back anytime!'),nl.