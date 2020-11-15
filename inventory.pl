/* inventory.pl */

/* Definisi Inventory dengan space 100 */

:- dynamic(usedSpace/1).
inventory(X) :- usedSpace(X).

/* Definisi Is In Inventory */

:- dynamic(stored/2).
isInInvent(X) :- stored(X,Y), Y > 0.

/* Definisi Save Item */

:- dynamic(saveItem/1).
saveItem(X) :-  (inventory(Used), Used < 100 ->
                (stored(X,Y) -> retract(stored(X,Y)), Z is Y+1, 
                asserta(stored(X,Z)), retract(usedSpace(Used)), 
                NewUsed is Used + 1, asserta(usedSpace(NewUsed));
                asserta(stored(X,1)), retract(usedSpace(Used)), 
                NewUsed is Used + 1, asserta(usedSpace(NewUsed))),
                write('Item stored to inventory. Your bag is heavier now.');
                write('Your inventory space is not enough to save this item.')).

/* Definisi Init Inventory */

/* Swordsman dan Knight */
initInventSK :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(iron_sword, 1)).

/* Archer dan Hunter */
initInventAH :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(slow_bow, 1)).

/* Sorcerer dan Magus */
initInventSM :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(neutral_wand, 1)).

/* Assassin dan Slayer */
initInventAS :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(dull_knife, 1)).

/* Tamer dan Summoner */
initInventTS :- asserta(usedSpace(6)), asserta(eqWeapon(none)), 
                asserta(eqArmor(none)), asserta(eqAccessory(none)), 
                asserta(stored(health_potion, 5)), asserta(stored(rockhard_leash, 1)).


/* Definisi Count Item */

countItem(Item, Count) :-  stored(Item, Count).