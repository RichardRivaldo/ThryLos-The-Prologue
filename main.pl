/* main.pl */

/* Supporting Files */

:- include('character.pl').
:- include('inventory.pl').
:- include('items.pl').
:- include('leveling.pl').
:- include('store.pl').
:- include('map.pl').
:- include('enemy.pl').
:- include('quest.pl').
:- include('battle.pl').

/* Definisi InitGame */

thrylos :-      write('    ______ __                  __               '), nl,
                write('   /_  __// /_   _____ __  __ / /   ____   _____'), nl,
                write('    / /  / __ \\ / ___// / / // /   / __ \\ / ___/'), nl,
                write('   / /  / / / // /   / /_/ // /___/ /_/ /(__  )'), nl,
                write('  /_/  /_/ /_//_/    \\__, //_____/\\____//____/'), nl,
                write('                    /____/       The Prologue '), nl, nl,

                write('                    `Vixere`                     '), nl,
                mainMenu, !.


/* Definisi Main Menu */

mainMenu :-     write('              _'), nl,
                write('  /\\/\\   __ _(_)_ __     /\\/\\   ___ _ __  _   _ '), nl,
                write(' /    \\ / _` | | \'_ \\   /    \\ / _ \\ \'_ \\| | | |'), nl,
                write('/ /\\/\\ \\ (_| | | | | | / /\\/\\ \\  __/ | | | |_| |'), nl,
                write('\\/    \\/\\__,_|_|_| |_| \\/    \\/\\___|_| |_|\\__,_|'), nl, nl,

                write('------------------------------------------------------'), nl,
                write('                 1. Start Your Journey                '), nl,
                write('------------------------------------------------------'), nl,
                write('------------------------------------------------------'), nl,
                write('                       2. WikiLog                     '), nl,
                write('------------------------------------------------------'), nl,
                write('------------------------------------------------------'), nl,
                write('                        3. About                      '), nl,
                write('------------------------------------------------------'), nl,
                write('------------------------------------------------------'), nl,
                write('                    4. Quit The Game                  '), nl,
                write('------------------------------------------------------'), nl, nl,

                write('Whatever you pick, we will support it! Now, what is it? '), read_integer(Nav),

                (Nav = 1 -> write('Have fun! May the force be with you.'), nl, nl, start, !;
                Nav = 2 -> write('Transferring you to our Wiki...'), nl, wiki, !;
                Nav = 3 -> write('Generating the Tales of ThryLos...'), nl, about, !;
                quit, !).

/* Definisi Quit Game */

quit :-         write('Are you sure you want to quit ThryLos? '), read(QChc), nl,
                (QChc == yes -> write('Now, do you want to store this to the Memento?'), nl,
                write('You can synchronized with your stats later if you pick yes, else you should start over!'), nl,
                write('The time has come! Now, which of it? '), read(SChc), nl,
                (SChc == yes -> save; !),
                write('Till we meet again, then!'), nl,
                retractall(started(_)), retractall(class(_, _)), retractall(health(_,_)),
                retractall(attack(_,_)), retractall(defense(_,_)), retractall(magic(_,_)),
                retractall(speed(_,_)), retractall(specialattack(_,_)), retractall(gold(_,_)),
                retractall(exp(_,_)), retractall(level(_,_)), retractall(eqWeapon(_)),
                retractall(eqAccessory(_)), retractall(eqArmor(_)), retractall(usedSpace(_)),
                retractall(stored(_,_)), retractall(player(_,_)), retractall(store(_,_)), 
                retractall(leftZone(_,_)), retractall(rightZone(_,_)), retractall(store(_,_)),
                retractall(dungeon(_,_)), retractall(quest(_,_)), retractall(innerWall(_,_)), 
                retractall(teleport(_,_)), retractall(isTaken(_,_)), retractall(zone(_));
                write('Pyuuhh. Let us continue, then!'), nl, !).


/* Definisi Start Game */

:- dynamic(started/1).
start    :-     started(_), write('You had started your journey, young\'un. Finish it first!'), nl.

start    :-     \+started(_), asserta(started(true)),
                write('Initializing The World of ThryLos..'), nl, initMap1,
                write('Preparing character modifications..'), nl,
                write('Producing powerful items and potions..'), nl,
                write('Generating quests that will save humanity..'), nl,
                write('All preparations completed.'), nl, nl,

                write('Welcome, mysterious adventurer. Reveal your identity now! '), read(Username), nl,
                
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
drink(Item) :-      usePotion(Item), !.

/* Check Inventory */
bag :-              inventory, !.

/* Discard Item */
throw(X, Z) :-      discard(X, Z), !.

/* Show Map */

map :-              (\+started(_) -> fail;
                    write('Activating the NVGXor to see the map..'), nl, nl,
                    zone(X), 
                    (X = 1 -> write('    ____  _      __  __         _       __    __ '), nl,
                    write('   / __ )(_)____/ /_/ /_  _____(_)___ _/ /_  / /_'), nl,
                    write('  / __  / / ___/ __/ __ \\/ ___/ / __ `/ __ \\/ __/'), nl,
                    write(' / /_/ / / /  / /_/ / / / /  / / /_/ / / / / /_ '), nl,
                    write('/_____/_/_/   \\__/_/ /_/_/  /_/\\__, /_/ /_/\\__/ '), nl,
                    write('                              /____/  '), nl, nl;
                    X = 2 -> write('    __              __     ______ '), nl,
                    write('   / /  ____  _____/ /_   / ____/   _____  _________ _________  ___  ____ '), nl,
                    write('  / /  / __ \\/ ___/ __/  / __/ | | / / _ \\/ ___/ __ `/ ___/ _ \\/ _ \\/ __ \\'), nl,
                    write(' / /__/ /_/ (__  ) /_   / /___ | |/ /  __/ /  / /_/ / /  /  __/  __/ / / /'), nl,
                    write('/_____|____/____/\\__/  /_____/ |___/\\___/_/   \\__, /_/   \\___/\\___/_/ /_/'), nl,
                    write('                                             /____/'), nl, nl;
                    write('    ____                               __ '), nl,
                    write('   / __ \\_________ _____ _____  ____  / /  ____ _____  ________'), nl,
                    write('  / / / / ___/ __ `/ __ `/ __ \\/ __ \\/ /  / __ `/ __ \\/ ___/ _ \\'), nl,
                    write(' / /_/ / /  / /_/ / /_/ / /_/ / / / / /__/ /_/ / / / / /__/  __/'), nl,
                    write('/_____/_/   \\__,_/\\__, /\\____/_/ /_/_____|__,_/_/ /_/\\___/\\___/'), nl,
                    write('                 /____/ '), nl, nl),
                    map(0, 15), nl,
                    write('-----------------------------------------------------------------------------------------'), nl,
                    write('                                   Legends of ThryLos                                    '), nl,
                    write('P : Your Current Position. You should know where you are!'), nl,
                    write('Q : The Quest Creator. All about Quest, you should do that here.'), nl,
                    write('S : The Almighty ThryStore. Spend your money on equipments and potions here!'), nl,
                    write('T : Ever heard of Teleport? Yeah, it also exists here. Don\'t be surprised, duh!'), nl,
                    write('D : Where The Pinnacle of Dragons, ApeX resides. Quickly take him down!'), nl,
                    write('* If you don\'t see any one of these, don\'t worry. You will find it later so keep going!'), nl,
                    write('-----------------------------------------------------------------------------------------'), nl, !).

save :-             write('Fill in The Memento ID you want to store your stats to: '), read(FileName), nl,
                    tell(FileName),
                        listing(started/1), listing(class/2), listing(health/2), 
                        listing(attack/2),  listing(defense/2), listing(magic/2), 
                        listing(speed/2), listing(specialattack/2), listing(gold/2), 
                        listing(exp/2), listing(zone/1), listing(level/2), 
                        listing(eqAccessory/1), listing(eqWeapon/1), listing(eqArmor/1), 
                        listing(usedSpace/1), listing(stored/2), listing(player/2),
                    told,
                    write('-------------------------------------------------------------------------'), nl,
                    write('---------------------------STORING YOUR POWERS---------------------------'), nl,
                    write('------------------------SHUTTING DOWN THE SYSTEM-------------------------'), nl,
                    write('-------------------------------------------------------------------------'), nl, nl, !.

load :-             write('Pick your Memento ID to synchronize with: '), read(FileName), nl,
                    (\+file_exists(FileName) -> write('You don\'t have this file, noob.'), nl, fail;
                    open(FileName, read, Stream), fToList(Stream, Lines),
                    lToCodes(Lines), close(Stream), zone(X), player(XNow, YNow),
                    (X = 1 -> initMap1; X = 2 -> initMap2; initMap3),
                    retractall(player(_,_)), asserta(player(XNow, YNow)),
                    write('-------------------------------------------------------------------------'), nl,
                    write('------------------------GETTING BACK YOUR POWERS-------------------------'), nl,
                    write('-----------------------SUCCESSFULLY SYNCHRONIZED!------------------------'), nl, 
                    write('-------------------------------------------------------------------------'), nl, nl,
                    write('Welcome back to ThryLos, '), class(User,_), write(User), write('!'), nl,
                    write('Let us continue our adventure to save ThryLos!'), nl), !.

fToList(S, []):-    at_end_of_stream(S).
   
fToList(S, [X|L]):- \+at_end_of_stream(S),
                    read(S, X),
                    fToList(S, L), !.

lToCodes(List) :-   (List = [] -> !;
                    List = [X|L] -> asserta(X), lToCodes(L), !).