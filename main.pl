/* main.pl */

/* Supporting Files */

:- include('character.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('leveling.pl').
:- include('store.pl').

/* Definisi Start Game */

start    :-     write('Welcome'), nl,
                write('Reveal your identity now, mysterious adventurer! '), read(Username), nl,

                write('This is the list of classes you can be.'), nl, nl,
                write('1. Swordsman: The classic, well-balanced fighter.'), nl, 
                write('2. Archer: Whoosh, a slinger with godspeed steps.'), nl, 
                write('3. Sorcerer: Accio, an expert in magics and spells.'), nl,
                write('4. Assassin: You cannot even hear their breath.'), nl, 
                write('5. Tamer: Cute pets can fight too!'), nl, nl,
                write('Fool! Do not let your eyes deceive you!'), nl, nl,
                
                write('What class do your heart desire, Oh Brave One? '), read_integer(ClassChoice), nl,

                (ClassChoice = 1 -> createSwordsman(Username),
                write('           /\\'),nl,
                write('          //\\\\'), nl,
                write('         //  \\\\'), nl,
                write('        //    \\\\'), nl,
                write('        |\\    /|'), nl,
                write('        | |  | |'), nl,
                write('        | |  | |'), nl,
                write('        | |  | |'), nl,
                write('        | |  | |'), nl,
                write('        | |  | |'), nl,
                write('        | |  | |'), nl,
                write('        | |  | |'), nl,
                write(' __     | |  | |     __'), nl,
                write('/  \\____| |  | |____/  \\'), nl,
                write(')   ___/  )  (  \\___   ('), nl,
                write('\\__/  \\__/    \\__/  \\__/'), nl,
                write('         \\____/'), nl,
                write('          )  ('), nl,
                write('         / /\\ \\'), nl,
                write('         ) )( ('), nl,
                write('         | || |'), nl,
                write('         | || |'), nl,
                write('         | || |'), nl,
                write('         | )( |'), nl,
                write('         ) \\/ ('), nl,
                write('         \\____/'), nl,
                write('         (____)'), nl, nl,

                write('You are now a Swordsman!'), nl;

                ClassChoice = 2 -> createArcher(Username),
                write('          4$$-.'), nl,
                write('           4   ".'), nl,
                write('           4    ^.'), nl,
                write('           4     $'), nl,
                write('           4     \'b'), nl,
                write('           4      "b.'), nl,
                write('           4        $'), nl,
                write('           4        $r'), nl,
                write('           4        $F'), nl,
                write('-$b========4========$b====*P=-'), nl,
                write('           4       *$$F'), nl,
                write('           4        $$"'), nl,
                write('           4       .$F'), nl,
                write('           4       dP'), nl,
                write('           4      F'), nl,
                write('           4     @'), nl,
                write('           4    .'), nl,
                write('           J. "'), nl,
                write('          4$$'), nl,

                write('You are now an Archer!'), nl;

                ClassChoice = 3 -> createSorcerer(Username),
                write('            .-------.'), nl,
                write('            |(~\\o/~)|'), nl,
                write('          _.||\\/X\\/||._'), nl,
                write('       ,-"  || \\ / ||  "-,'), nl,
                write('     ,\'  () ||o X o|| ()  \','), nl,
                write('    / ()  ,-|| / \\ ||-,  () \\'), nl,
                write('   : o  ,\'  ||/\\X/\\||  \',  o ;'), nl,
                write('.----------._).-.-.(_.----------.'), nl,
                write('|\\/)~~(\\/\\ o (     ) o /\\/)~~(\\/|'), nl,
                write('|(X () X)  .-.\\ : /.-.  (X () X)|'), nl,
                write('|/\\)__(/\\/(   .`:`.   )\\/\\)__(/\\|'), nl,
                write('\'----------(   /|\\   )----------\''), nl,
                write('   ; o  \',  |"` | `"|  ,\'  o ;'), nl,
                write('    \\ ()  \'-|  /o\\  |-\'  () /'), nl,
                write('     \',  () |(~\\ /~)| ()  ,\''), nl,
                write('       \'-._ ||\\/X\\/|| _.-\''), nl,
                write('           \'|| \\ / ||\''), nl,
                write('            ||  X  ||'), nl,
                write('            ||\\(/\\/||'), nl,
                write('            ||=)O(=||'), nl,
                write('            ||/\\/)\\||'), nl,
                write('            ||  X  ||'), nl,
                write('            || / \\ ||'), nl,
                write('            ||/\\X/\\||'), nl,
                write('            |(_/o\\_)|'), nl,
                write('            \'._____.\''), nl, nl,

                write('You are now a Sorcerer!'), nl;

                ClassChoice = 4 -> createAssassin(Username),
                write('       .---.'), nl,
                write('       |---|'), nl,
                write('       |---|'), nl,
                write('       |---|'), nl,
                write('   .---^ - ^---.'), nl,
                write('   :___________:'), nl,
                write('      |  |//|'), nl,
                write('      |  |//|'), nl,
                write('      |  |//|'), nl,
                write('      |  |//|'), nl,
                write('      |  |//|'), nl,
                write('      |.-\'**|'), nl,
                write('       \\***/'), nl,
                write('        \\*/'), nl,
                write('         V'), nl, nl,
                write('        \''), nl,
                write('         ^\''), nl,
                write('        (_)'), nl, nl, nl,
                write('    -.   ^   .-'), nl,
                write('______\\\'.|.\'/________'), nl, nl,
                
                write('You are now an Assassin!'), nl;

                ClassChoice = 5 -> createTamer(Username),
                write('                              __'), nl,
                write('                            .d$$b'), nl,
                write('                          .\' TO$;\\'), nl,
                write('                         /  : TP._;'), nl,
                write('                        / _.;  :Tb|'), nl,
                write('                       /   /   ;j$j'), nl,
                write('                   _.-"       d$$$$'), nl,
                write('                 .\' ..       d$$$$;'), nl,
                write('                /  /P\'      d$$$$P. |\\'), nl,
                write('               /   "      .d$$$P\' |\\^"l'), nl,
                write('             .\'           `T$P^"""""  :'), nl, 
                write('         ._.\'      _.\'                ;'), nl,
                write('      `-.-".-\'-\' ._.       _.-"    .-"'), nl,
                write('    `.-" _____  ._              .-"'), nl,
                write('   -(.g$$$$$$$b.              .\''), nl,
                write('     ""^^T$$$P^)            .(:'), nl,
                write('       _/  -"  /.\'         /:/;'), nl,
                write('    ._.\'-\'`-\'  ")/         /;/;'), nl,
                write(' `-.-"..--""   " /         /  ;'), nl,
                write('.-" ..--""        -\'          :'), nl,
                write('..--""--.-"         (\\      .-(\\'), nl,
                write('  ..--""              `-\\(\\/;`'), nl,
                write('    _.                      :'), nl,
                write('                            ;`-'), nl,
                write('                           :\\'), nl,
                write('                           ;'), nl, nl,

                write('You are now a Tamer!'), nl;

                ClassChoice = 0 -> surprise(Username), nl;

                write('--------------!!DANGERS!!--------------'), nl,
                write('----------WHAT DID YOU INPUT?----------'), nl,
                write('---------------------------------------'), nl, nl,
                write('***************************************'), nl,
                write('----------==IT IS OVER NOW==-----------'), nl,
                write('----------------ADIEU..----------------'), nl,
                write('***************************************'), nl, halt).

/* Input perintah */

/* Check Stats dan Equipment Player */
stats :-            class(User, _), checkStats(User), !.

/* Weapon Info */
weapon(X) :-        isWeapon(X,_), checkWeapon(X), !.

/* Armor Info */
armor(X) :-         isArmor(X, _), checkArmor(X), !.

/* Accessory Info */
accessory(X) :-     isAccessory(X, _), checkAcc(X), !.

/* Potion Info */
potion(X) :-        isPotion(X,_), checkPotion(X), !.

/* Equip dan Unequip Weapon */
equipWp(X) :-       equipWeapon(X), !.
unequipWp(X) :-     unEquipWeapon(X), !.

/* Equip dan Unequip Armor */
equipArm(X) :-      equipArmor(X), !.
unequipArm(X) :-    unEquipArmor(X), !.

/* Equip dan Unequip Accessory */
equipAccs(X) :-     equipAcc(X), !.
unequipAccs(X) :-   unEquipAcc(X), !.

/* Activate Potion */
drink(Item) :- usePotion(Item), !.

/* Check Inventory */
bag :-         inventory, !.

/* Discard Item */
throw(X, Z) :-  discard(X, Z), !.

