/* items.pl */

/* Weapon Swordsman dan Knight */

isWeapon(iron_sword, swordsman).
isWeapon(iron_sword, knight).
isWeapon(platinum_sword, swordsman).
isWeapon(platinum_sword, knight).
isWeapon(adamantite_sword, swordsman).
isWeapon(adamantite_sword, knight).
isWeapon(mikazuki, swordsman).
isWeapon(mikazuki, knight).
isWeapon(exCalibur, knight).

/* Weapon Archer dan Hunter */

isWeapon(slow_bow, archer).
isWeapon(slow_bow, hunter).
isWeapon(agile_bow, archer).
isWeapon(agile_bow, hunter).
isWeapon(flash_bow, archer).
isWeapon(flash_bow, hunter).
isWeapon(achilles, archer).
isWeapon(achilles, hunter).
isWeapon(apollo, hunter).

/* Weapon Sorcerer dan Magus */

isWeapon(neutral_wand, sorcerer).
isWeapon(neutral_wand, magus).
isWeapon(dark_wand, sorcerer).
isWeapon(dark_wand, magus).
isWeapon(bright_wand, sorcerer).
isWeapon(bright_wand, magus).
isWeapon(tarot, sorcerer).
isWeapon(tarot, magus).
isWeapon(odyssey, magus).

/* Weapon Assassin dan Slayer */

isWeapon(dull_knife, assassin).
isWeapon(dull_knife, slayer).
isWeapon(sharp_knife, assassin).
isWeapon(sharp_knife, slayer).
isWeapon(deadly_knife, assassin).
isWeapon(deadly_knife, slayer).
isWeapon(ezio, assassin).
isWeapon(ezio, slayer).
isWeapon(scythe, slayer).

/* Weapon Tamer dan Summoner */

isWeapon(rockhard_leash, tamer).
isWeapon(rockhard_leash, summoner).
isWeapon(cotton_leash, tamer).
isWeapon(cotton_leash, summoner).
isWeapon(sutra_leash, tamer).
isWeapon(sutra_leash, summoner).
isWeapon(lung, tamer).
isWeapon(lung,summoner).
isWeapon(ouroboros, summoner).

/* Armor General Class */

isArmor(kavacha, Class) :- isClass(Class).
isArmor(aegis, Class) :- isClass(Class).
isArmor(wukong, Class) :- isClass(Class).
isArmor(tarnhelm, Class) :- isClass(Class).
isArmor(diomedes, Class) :- isClass(Class).
isArmor(beowulf, Class) :- isClass(Class).

/* Accessory General Class */

isAccessory(brynhildr, Class) :- isClass(Class).
isAccessory(ragnar, Class) :- isClass(Class).
isAccessory(harmonia, Class) :- isClass(Class).
isAccessory(medusa, Class) :- isClass(Class).
isAccessory(amaterasu, Class) :- isClass(Class).
isAccessory(theseus, Class) :- isClass(Class).

/* Potion General Class */

isPotion(health_potion, Class) :- isClass(Class).
isPotion(attack_potion, Class) :- isClass(Class).
isPotion(defense_potion, Class) :- isClass(Class).
isPotion(magic_potion, Class) :- isClass(Class).
isPotion(speed_potion, Class) :- isClass(Class).

/* Item Grading */

/* Ghost Grade */

itemClass(iron_sword, ghost).
itemClass(slow_bow, ghost).
itemClass(neutral_wand, ghost).
itemClass(dull_knife, ghost).
itemClass(rockhard_leash, ghost).
itemClass(kavacha, ghost).
itemClass(brynhildr, ghost).

/* Demon Grade */

itemClass(platinum_sword, demon).
itemClass(agile_bow, demon).
itemClass(dark_wand, demon).
itemClass(sharp_knife, demon).
itemClass(cotton_leash, demon).
itemClass(aegis, demon).
itemClass(ragnar, demon).

/* Mamon Grade */

itemClass(adamantite_sword, mamon).
itemClass(flash_bow, mamon).
itemClass(bright_wand, mamon).
itemClass(deadly_knife, mamon).
itemClass(sutra_leash, mamon).
itemClass(wukong, mamon).
itemClass(harmonia, mamon).

/* Lucifer Grade */

itemClass(mikazuki, lucifer).
itemClass(achilles, lucifer).
itemClass(tarot, lucifer).
itemClass(ezio, lucifer).
itemClass(lung, lucifer).
itemClass(diomedes, lucifer).
itemClass(amaterasu, lucifer).

/* God Grade */

itemClass(exCalibur, god).
itemClass(apollo, god).
itemClass(odyssey, god).
itemClass(scythe, god).
itemClass(ouroboros, god).
itemClass(beowulf, god).
itemClass(theseus, god).

/* Definisi Equip dan Unequip Item */

:- dynamic(eqWeapon/1).
:- dynamic(eqArmor/1).
:- dynamic(eqAccessory/1).

/* Definisi Equip dan Unequip Weapon */
equipWeapon(Item) :-    (isInInvent(Item), isWeapon(Item, Class),
                        class(_, Class) -> retract(eqWeapon(_)), 
                        asserta(eqWeapon(Item)), retract(stored(Item,X)), 
                        Y is X-1, asserta(stored(Item,Y)), boostWp(Item),
                        retract(usedSpace(Used)), NewUsed is Used - 1,
                        asserta(usedSpace(NewUsed)), write('Item equipped. Feeling it now?'), nl;
                        \+(isInInvent(Item)) -> write('Pathetic. Go Gacha this item now!'), nl;
                        write('This item is not suitable for you. Don\'t you know it, doe?'), nl).

unEquipWeapon(Item) :-  (eqWeapon(Item) -> nerfedWp(Item),
                        (stored(Item,X) -> retract(stored(Item,X)), 
                        Y is X + 1, asserta(stored(Item, Y));
                        asserta(stored(Item,1))), asserta(eqWeapon(none)),
                        inventory(Used), Used < 100,
                        retract(eqWeapon(Item)), retract(usedSpace(Used)),
                        NewUsed is Used + 1, asserta(usedSpace(NewUsed)),
                        write('Item unequipped. You become weaker now.'), nl;
                        write('Ha! You don\'t even wear it right now.'), nl).

/* Definisi Equip dan Unequip Armor */
equipArmor(Item) :-    (isInInvent(Item), isArmor(Item, Class),
                        class(_, Class) -> retract(eqArmor(_)),
                        asserta(eqArmor(Item)), retract(stored(Item,X)), 
                        Y is X-1, asserta(stored(Item,Y)), boostArm(Item),
                        retract(usedSpace(Used)), NewUsed is Used - 1,
                        asserta(usedSpace(NewUsed)), write('Item equipped. Feeling it now?'), nl;
                        \+(isInInvent(Item)) -> write('Pathetic. Go Gacha this item now!'), nl;
                        write('This item is not suitable for you. Don\'t you know it, doe?'), nl).

unEquipArmor(Item) :-   (eqArmor(Item) -> nerfedArm(Item),
                        (stored(Item,X) -> retract(stored(Item,X)), 
                        Y is X + 1, asserta(stored(Item, Y));
                        asserta(stored(Item,1))), asserta(eqArmor(none)),
                        inventory(Used), Used < 100,
                        retract(eqArmor(Item)), retract(usedSpace(Used)),
                        NewUsed is Used + 1, asserta(usedSpace(NewUsed)),
                        write('Item unequipped. You become weaker now.'), nl;
                        write('Ha! You don\'t even wear it right now.'), nl).

/* Definisi Equip dan Unequip Accessory */

equipAcc(Item) :-       (isInInvent(Item), isAccessory(Item, Class),
                        class(_, Class) -> retract(eqAccessory(_)),
                        asserta(eqAccessory(Item)), retract(stored(Item,X)), 
                        Y is X-1, asserta(stored(Item,Y)), boostAcc(Item),
                        retract(usedSpace(Used)), NewUsed is Used - 1,
                        asserta(usedSpace(NewUsed)), write('Item equipped. Feeling it now?'), nl;
                        \+(isInInvent(Item)) -> write('Pathetic. Go Gacha this item now!'), nl;
                        write('This item is not suitable for you. Don\'t you know it, doe?'), nl).

unEquipAcc(Item) :-     (eqAccessory(Item) -> nerfedAcc(Item),
                        (stored(Item,X) -> retract(stored(Item,X)), 
                        Y is X + 1, asserta(stored(Item, Y));
                        asserta(stored(Item,1))),asserta(eqAccessory(none)),
                        inventory(Used), Used < 100,
                        retract(eqAccessory(Item)), retract(usedSpace(Used)),
                        NewUsed is Used + 1, asserta(usedSpace(NewUsed)),
                        write('Item unequipped. You become weaker now.'), nl;
                        write('Ha! You don\'t even wear it right now.'), nl).

/* Definisi Use Potion */

usePotion(Item) :-      (isInInvent(Item), isPotion(Item, Class), class(_, Class)
                        -> retract(stored(Item,X)), Y is X-1, asserta(stored(Item, Y)),
                        retract(usedSpace(Used)), NewUsed is Used-1, asserta(usedSpace(NewUsed)),
                        boostPotion(Item),
                        write('You are in a better shape now than ever!'), nl;
                        \+(isInInvent(Item)) -> write('You run out of potions. Quick, refill it!'), nl).

/* Definisi Discard Item */

discard(Item, Z) :-     (isInInvent(Item) -> stored(Item, X), Y is X-Z, 
                        (Y =< 0 -> retract(stored(Item, X)), retract(usedSpace(Used)),
                        NewUsed is Used - X, asserta(usedSpace(NewUsed));
                        retract(stored(Item, X)), asserta(stored(Item, Y)), retract(usedSpace(Used)),
                        NewUsed is Used - Z, asserta(usedSpace(NewUsed))),
                        write('Item discarded successfully.'), nl;
                        write('You don\'t discard something you don\'t have, you know.'), nl).

/* Definisi Check Weapon */

checkWeapon(X) :-       write(' __    __                             '), nl,
                        write('/ / /\\ \\ \\___  __ _ _ __   ___  _ __  '), nl,
                        write('\\ \\/  \\/ / _ \\/ _` | \'_ \\ / _ \\| \'_ \\ '), nl,
                        write(' \\  /\\  /  __/ (_| | |_) | (_) | | | |'), nl,
                        write('  \\/  \\/ \\___|\\__,_| .__/ \\___/|_| |_|'), nl,
                        write('                   |_|                '), nl, nl,
                        itemClass(X, CWeapon), 
                        write('Identity    : '), write(X), nl, write('Grade       : '), write(CWeapon), nl,
                        write('Restriction : '), write('|'), forall((isWeapon(X,Class)), (write(Class), write('|'))), nl,
                        write('Effects     : ???'), nl.

/* Definisi Check Armor */

checkArmor(X) :-        write('   _                             '), nl,
                        write('  /_\\  _ __ _ __ ___   ___  _ __ '), nl,
                        write(' //_\\\\| \'__| \'_ ` _ \\ / _ \\| \'__|'), nl,
                        write('/  _  \\ |  | | | | | | (_) | |   '), nl,
                        write('\\_/ \\_/_|  |_| |_| |_|\\___/|_|   '), nl, nl,
                        itemClass(X, CArmor), 
                        write('Identity    : '), write(X), nl, write('Grade       : '), write(CArmor), nl,
                        write('Restriction : No Class Restriction.'), nl,
                        write('Effects     : ???'), nl.

/* Definisi Check Accessory */

checkAcc(X) :-          write('   _'), nl,
                        write('  /_\\   ___ ___ ___  ___ ___  ___  _ __ _   _ '), nl,
                        write(' //_\\\\ / __/ __/ _ \\/ __/ __|/ _ \\| \'__| | | |'), nl,
                        write('/  _  \\ (_| (_|  __/\\__ \\__ \\ (_) | |  | |_| |'), nl,
                        write('\\_/ \\_/\\___\\___\\___||___/___/\\___/|_|   \\__, |'), nl,
                        write('                                        |___/ '), nl, nl,
                        itemClass(X, CAcc),
                        write('Identity    : '), write(X), nl, write('Grade       : '), write(CAcc), nl,
                        write('Restriction : No Class Restriction.'), nl,
                        write('Effects     : ???'), nl.

/* Definisi Check Potion */

checkPotion(X) :-       write('   ___      _   _             '), nl,
                        write('  / _ \\___ | |_(_) ___  _ __  '), nl,
                        write(' / /_)/ _ \\| __| |/ _ \\| \'_ \\ '), nl,
                        write('/ ___/ (_) | |_| | (_) | | | |'), nl,
                        write('\\/    \\___/ \\__|_|\\___/|_| |_|'), nl, nl,
                        write('Identity    : '), write(X), nl,
                        write('Restriction : No Class Restriction.'), nl,
                        write('Effects     : The God himself is giving you His Blessings.'), nl.

/* Definisi tipe item */

swords(Item) :-         isWeapon(Item, swordsman).
swords(Item) :-         isWeapon(Item, knight).

bow(Item) :-            isWeapon(Item, archer).
bow(Item) :-            isWeapon(Item, hunter).

wand(Item) :-           isWeapon(Item, sorcerer).
wand(Item) :-           isWeapon(Item, magus).

knife(Item) :-          isWeapon(Item, assassin).
knife(Item) :-          isWeapon(Item, slayer).

leashes(Item) :-        isWeapon(Item, tamer).
leashes(Item) :-        isWeapon(Item, summoner).

/* Definisi Boost Stats Item */

boostWp(Item) :-        class(User, Class), isWeapon(Item, Class), itemClass(Item, Grade),
                        (swords(Item) ->
                        (Grade == ghost -> retract(attack(User, PrevStats)), NewStats is PrevStats + 2, asserta(attack(User, NewStats));
                        Grade == demon -> retract(attack(User, PrevStats)), NewStats is PrevStats + 3, asserta(attack(User, NewStats));
                        Grade == mamon -> retract(attack(User, PrevStats)), NewStats is PrevStats + 4, asserta(attack(User, NewStats));
                        Grade == lucifer -> retract(attack(User, PrevStats)), NewStats is PrevStats + 6, asserta(attack(User, NewStats));
                        retract(attack(User, PrevStats)), NewStats is PrevStats + 10, asserta(attack(User, NewStats)));

                        bow(Item) ->
                        (Grade == ghost -> retract(speed(User, PrevStats)), NewStats is PrevStats + 2, asserta(speed(User, NewStats));
                        Grade == demon -> retract(speed(User, PrevStats)), NewStats is PrevStats + 3, asserta(speed(User, NewStats));
                        Grade == mamon -> retract(speed(User, PrevStats)), NewStats is PrevStats + 4, asserta(speed(User, NewStats));
                        Grade == lucifer -> retract(speed(User, PrevStats)), NewStats is PrevStats + 6, asserta(speed(User, NewStats));
                        retract(speed(User, PrevStats)), NewStats is PrevStats + 10, asserta(speed(User, NewStats)));

                        wand(Item) ->
                        (Grade == ghost -> retract(magic(User, PrevStats)), NewStats is PrevStats + 2, asserta(magic(User, NewStats));
                        Grade == demon -> retract(magic(User, PrevStats)), NewStats is PrevStats + 3, asserta(magic(User, NewStats));
                        Grade == mamon -> retract(magic(User, PrevStats)), NewStats is PrevStats + 4, asserta(magic(User, NewStats));
                        Grade == lucifer -> retract(magic(User, PrevStats)), NewStats is PrevStats + 6, asserta(magic(User, NewStats));
                        retract(magic(User, PrevStats)), NewStats is PrevStats + 10, asserta(magic(User, NewStats)));

                        knife(Item) ->
                        (Grade == ghost -> retract(attack(User, PrevStats)), NewStats is PrevStats + 2, asserta(attack(User, NewStats));
                        Grade == demon -> retract(attack(User, PrevStats)), NewStats is PrevStats + 3, asserta(attack(User, NewStats));
                        Grade == mamon -> retract(attack(User, PrevStats)), NewStats is PrevStats + 4, asserta(attack(User, NewStats));
                        Grade == lucifer -> retract(attack(User, PrevStats)), NewStats is PrevStats + 6, asserta(attack(User, NewStats));
                        retract(attack(User, PrevStats)), NewStats is PrevStats + 10, asserta(attack(User, NewStats)));

                        leashes(Item) ->
                        (Grade == ghost -> retract(health(User, PrevStats)), NewStats is PrevStats + 2, asserta(health(User, NewStats));
                        Grade == demon -> retract(health(User, PrevStats)), NewStats is PrevStats + 3, asserta(health(User, NewStats));
                        Grade == mamon -> retract(health(User, PrevStats)), NewStats is PrevStats + 4, asserta(health(User, NewStats));
                        Grade == lucifer -> retract(health(User, PrevStats)), NewStats is PrevStats + 6, asserta(health(User, NewStats));
                        retract(health(User, PrevStats)), NewStats is PrevStats + 10, asserta(health(User, NewStats)))).

boostArm(Item) :-       class(User, Class), isArmor(Item, Class), itemClass(Item, Grade),
                        (Grade == ghost -> retract(defense(User, PrevStats)), NewStats is PrevStats + 2, asserta(defense(User, NewStats));
                        Grade == demon -> retract(defense(User, PrevStats)), NewStats is PrevStats + 3, asserta(defense(User, NewStats));
                        Grade == mamon -> retract(defense(User, PrevStats)), NewStats is PrevStats + 4, asserta(defense(User, NewStats));
                        Grade == lucifer -> retract(defense(User, PrevStats)), NewStats is PrevStats + 6, asserta(defense(User, NewStats));
                        retract(defense(User, PrevStats)), NewStats is PrevStats + 10, asserta(defense(User, NewStats))).

boostAcc(Item) :-       class(User, Class), isAccessory(Item, Class), itemClass(Item, Grade),
                        (Grade == ghost -> retract(health(User, PrevStats)), NewStats is PrevStats + 2, asserta(health(User, NewStats));
                        Grade == demon -> retract(health(User, PrevStats)), NewStats is PrevStats + 3, asserta(health(User, NewStats));
                        Grade == mamon -> retract(health(User, PrevStats)), NewStats is PrevStats + 4, asserta(health(User, NewStats));
                        Grade == lucifer -> retract(health(User, PrevStats)), NewStats is PrevStats + 6, asserta(health(User, NewStats));
                        retract(health(User, PrevStats)), NewStats is PrevStats + 10, asserta(health(User, NewStats))).

/* Definisi Nerf Stats Item */

nerfedWp(Item) :-       class(User, Class), isWeapon(Item, Class), itemClass(Item, Grade),
                        (swords(Item) ->
                        (Grade == ghost -> retract(attack(User, PrevStats)), NewStats is PrevStats - 2, asserta(attack(User, NewStats));
                        Grade == demon -> retract(attack(User, PrevStats)), NewStats is PrevStats - 3, asserta(attack(User, NewStats));
                        Grade == mamon -> retract(attack(User, PrevStats)), NewStats is PrevStats - 4, asserta(attack(User, NewStats));
                        Grade == lucifer -> retract(attack(User, PrevStats)), NewStats is PrevStats - 6, asserta(attack(User, NewStats));
                        retract(attack(User, PrevStats)), NewStats is PrevStats - 10, asserta(attack(User, NewStats)));

                        bow(Item) ->
                        (Grade == ghost -> retract(speed(User, PrevStats)), NewStats is PrevStats - 2, asserta(speed(User, NewStats));
                        Grade == demon -> retract(speed(User, PrevStats)), NewStats is PrevStats - 3, asserta(speed(User, NewStats));
                        Grade == mamon -> retract(speed(User, PrevStats)), NewStats is PrevStats - 4, asserta(speed(User, NewStats));
                        Grade == lucifer -> retract(speed(User, PrevStats)), NewStats is PrevStats - 6, asserta(speed(User, NewStats));
                        retract(speed(User, PrevStats)), NewStats is PrevStats - 10, asserta(speed(User, NewStats)));

                        wand(Item) ->
                        (Grade == ghost -> retract(magic(User, PrevStats)), NewStats is PrevStats - 2, asserta(magic(User, NewStats));
                        Grade == demon -> retract(magic(User, PrevStats)), NewStats is PrevStats - 3, asserta(magic(User, NewStats));
                        Grade == mamon -> retract(magic(User, PrevStats)), NewStats is PrevStats - 4, asserta(magic(User, NewStats));
                        Grade == lucifer -> retract(magic(User, PrevStats)), NewStats is PrevStats - 6, asserta(magic(User, NewStats));
                        retract(magic(User, PrevStats)), NewStats is PrevStats - 10, asserta(magic(User, NewStats)));

                        knife(Item) ->
                        (Grade == ghost -> retract(attack(User, PrevStats)), NewStats is PrevStats - 2, asserta(attack(User, NewStats));
                        Grade == demon -> retract(attack(User, PrevStats)), NewStats is PrevStats - 3, asserta(attack(User, NewStats));
                        Grade == mamon -> retract(attack(User, PrevStats)), NewStats is PrevStats - 4, asserta(attack(User, NewStats));
                        Grade == lucifer -> retract(attack(User, PrevStats)), NewStats is PrevStats - 6, asserta(attack(User, NewStats));
                        retract(attack(User, PrevStats)), NewStats is PrevStats - 10, asserta(attack(User, NewStats)));

                        leashes(Item) ->
                        (Grade == ghost -> retract(health(User, PrevStats)), NewStats is PrevStats - 2, asserta(health(User, NewStats));
                        Grade == demon -> retract(health(User, PrevStats)), NewStats is PrevStats - 3, asserta(health(User, NewStats));
                        Grade == mamon -> retract(health(User, PrevStats)), NewStats is PrevStats - 4, asserta(health(User, NewStats));
                        Grade == lucifer -> retract(health(User, PrevStats)), NewStats is PrevStats - 6, asserta(health(User, NewStats));
                        retract(health(User, PrevStats)), NewStats is PrevStats - 10, asserta(health(User, NewStats)))).

nerfedArm(Item) :-      class(User, Class), isArmor(Item, Class), itemClass(Item, Grade),
                        (Grade == ghost -> retract(defense(User, PrevStats)), NewStats is PrevStats - 2, asserta(defense(User, NewStats));
                        Grade == demon -> retract(defense(User, PrevStats)), NewStats is PrevStats - 3, asserta(defense(User, NewStats));
                        Grade == mamon -> retract(defense(User, PrevStats)), NewStats is PrevStats - 4, asserta(defense(User, NewStats));
                        Grade == lucifer -> retract(defense(User, PrevStats)), NewStats is PrevStats - 6, asserta(defense(User, NewStats));
                        retract(defense(User, PrevStats)), NewStats is PrevStats - 10, asserta(defense(User, NewStats))).

nerfedAcc(Item) :-      class(User, Class), isAccessory(Item, Class), itemClass(Item, Grade),
                        (Grade == ghost -> retract(health(User, PrevStats)), NewStats is PrevStats - 2, asserta(health(User, NewStats));
                        Grade == demon -> retract(health(User, PrevStats)), NewStats is PrevStats - 3, asserta(health(User, NewStats));
                        Grade == mamon -> retract(health(User, PrevStats)), NewStats is PrevStats - 4, asserta(health(User, NewStats));
                        Grade == lucifer -> retract(health(User, PrevStats)), NewStats is PrevStats - 6, asserta(health(User, NewStats));
                        retract(health(User, PrevStats)), NewStats is PrevStats - 10, asserta(health(User, NewStats))).

/* Definisi Boost Potion */

boostPotion(Item) :-    class(User, Class), isPotion(Item, Class), 
                        (Item == health_potion -> retract(health(User, PrevStats)), NewStats is PrevStats + 2, asserta(health(User, NewStats));
                        Item == attack_potion -> retract(attack(User, PrevStats)), NewStats is PrevStats + 2, asserta(attack(User, NewStats));
                        Item == defense_potion -> retract(defense(User, PrevStats)), NewStats is PrevStats + 2, asserta(defense(User, NewStats));
                        Item == magic_potion -> retract(magic(User, PrevStats)), NewStats is PrevStats + 2, asserta(magic(User, NewStats));
                        retract(speed(User, PrevStats)), NewStats is PrevStats + 2, asserta(speed(User, NewStats))).