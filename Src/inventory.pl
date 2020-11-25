/* inventory.pl */

/* Definisi Inventory dengan space 100 */

:- dynamic(usedSpace/1).
inventory(X) :- usedSpace(X).

/* Definisi Is In Inventory */

:- dynamic(stored/2).
isInInvent(X) :- stored(X,Y), Y > 0.

/* Definisi Save Item */

saveItem(X) :-  (inventory(Used), Used < 100 ->
                (stored(X,Y) -> retract(stored(X,Y)), Z is Y+1, 
                asserta(stored(X,Z)), retract(usedSpace(Used)), 
                NewUsed is Used + 1, asserta(usedSpace(NewUsed));
                asserta(stored(X,1)), retract(usedSpace(Used)), 
                NewUsed is Used + 1, asserta(usedSpace(NewUsed))),
                write('Item stored to inventory. Your bag is heavier now.'), nl;
                write('Your inventory space is not enough to save this item.'), nl).

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


/* Definisi Wiki */

wiki :-         write(' __    __ _ _    _   __'), nl,
                write('/ / /\\ \\ (_) | _(_) / /  ___   __ _ '), nl,
                write('\\ \\/  \\/ / | |/ / |/ /  / _ \\ / _` |'), nl,
                write(' \\  /\\  /| |   <| / /__| (_) | (_| |'), nl,
                write('  \\/  \\/ |_|_|\\_\\_\\____/\\___/ \\__, |'), nl,
                write('                              |___/ '), nl, nl,

                write('WikiLog here, guiding our new players to survive and win the game!'), nl, nl,
                write('0. Navigate to the Main Menu by using the magic words `mainMenu`.'), nl,
                write('1. In case you have not started your journey yet, use `start.` or go to the Main Menu to begin or go to Main Menu!'), nl,
                write('2. Reveal your identity and don\'t forget to end it with `.`, else our old machine cannot read your name!'), nl,
                write('3. Choose your class wisely. We keep the secrets of each classes, so you should experiment it all if you want to know more about them!'), nl,
                write('4. Wait. One more thing about class. Try to find the key to the best class available in the game!'), nl,
                write('5. After you are registered, you will be given basic starter tools. We want you to survive and not die on the day you start!'), nl,
                write('6. You can check your stats with the command `stats.`, never think that you are already strong!'), nl,
                write('7. These are navigations that you can take from this WikiLog to your desired curiosity: '), nl, nl,
                write('   * Enter any other numbers to go back to Main Menu. Basic, isn\'t it?'), nl,
                write('   * Enter 0 to read the Tales of ThryLos. It is good to know some histories!'), nl,
                write('   * Enter 1 to know more about your spacial bag. Practical storage is an important thing, you know!'), nl,
                write('   * Enter 2 to find out more about equipments in our territory. Adapting faster is one way to survive!'), nl,
                write('   * Enter 3 to have some informations about potions, The Blessings from Gods bestowed upon us!'), nl, 
                write('   * Enter 4 to sneak a peek at places in ThryLos. You should know some geography to some extent too!'), nl,
                write('   * Enter 5 to get some knowledge on how The Almighty ThryStore works. Be careful on spending your money!'), nl,
                write('   * Enter 6 to learn about the monsters that invaded ThryLos. It is always good to know about your opponents!'), nl, 
                write('   * Enter 7 to get some knowledge on the quest you can do to proceed faster in the game. We need helps!'), nl, nl,
                write('The choice is yours. You do it: '), read_integer(WikiChoice), nl,
                (WikiChoice = 0 -> about;
                WikiChoice = 1 -> invWiki;
                WikiChoice = 2 -> eqWiki;
                WikiChoice = 3 -> potWiki;
                WikiChoice = 4 -> mapWiki;
                WikiChoice = 5 -> storeWiki;
                WikiChoice = 6 -> enemyWiki;
                WikiChoice = 7 -> questWiki;
                mainMenu).

about :-        write('   _   _                 _   '), nl,
                write('  /_\\ | |__   ___  _   _| |_ '), nl,
                write(' //_\\\\| \'_ \\ / _ \\| | | | __|'), nl,
                write('/  _  \\ |_) | (_) | |_| | |_ '), nl,
                write('\\_/ \\_/_.__/ \\___/ \\__,_|\\__|'), nl, nl,

                write('Contains the legendary tales of the boundaryless world, `ThryLos`.'), nl, nl,
                write('It was 400 Lustrum ago, when suddenly crevices started to appear out of nowhere.'), nl,
                write('Monsters were crawling out of the cracks. Technologies had no effects on them.'), nl,
                write('Lots died, even if they had survived, they lost their hope and light in their life.'), nl,
                write('But, with the generousity of Gods, Blessings are pouring down from Heavens.'), nl,
                write('They were not superhuman strength, or mystical powers.'), nl, nl, 
                
                write('They are just like you. Ones who died in the other parallel world. We call them `Legends`.'), nl,
                write('`ThryLos` is the world of `Legends`, ones who saved humankind from Despairs.'), nl,
                write('The Contractor of Hell will select only few of capable humans to get into ThryLos and save it!'), nl,
                write('With the word `Vixere`, one who died will live again.'), nl,
                write('Mankind has been in Peace as the Legends protected them for a long time.'), nl, nl,
                write('The Legends has long been gone. So, why are you called, now?'), nl,
                write('Enter `why.` to know more about this. So, are you curious? '), read(Why), nl,
                (Why == why ->
                write('After a long time of Peace, Thrylos, now a Kingdom, finally faces their fear once again.'), nl, nl,
                
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
                write('The Pinnacle of Dragons, ApeX, is ressurecting once again.'), nl,
                write('Now, you carry on the fate of every people of ThryLos.'), nl,
                write('Will mankind survive once again? Or will it be the end of human?'), nl, nl,
                write('IT IS ALL ON YOU!'), nl, nl,
                write('------------------------------------------------------------------------------------------------------'), nl, nl,
                write('The word `ThryLos` comes from Greek, meaning `Legend`.'), nl,
                write('`Vixere` comes from Roman Latin, meaning `They live`, used after the execution of someone.'), nl, nl;
                write('Curiosity is needed in this world. Even so, we will gladly wait for you to check the Tales of ThryLos!'), nl).          

invWiki :-      write('   ___ '), nl,
                write('  / __\\ __ _  __ _ '), nl,
                write(' /__\\/// _` |/ _` |'), nl,
                write('/ \\/  \\ (_| | (_| |'), nl,
                write('\\_____/\\__,_|\\__, |'), nl,
                write('             |___/ '), nl, nl,

                write('1. You are given a spacial bag to store your items with maximum space of 100. Only store important items in it!'), nl,
                write('2. Use the command `bag.` to check what you bring with you now. It is always good to be prepared~'), nl,
                write('3. We do not want you to keep useless items. Use `throw(item_name, amount).` to throw it away. DO IT NOW!!!'), nl.

eqWiki :-       write('  _____ _   '), nl,
                write('  \\_   \\ |_ ___ _ __ ___  ___ '), nl,
                write('   / /\\/ __/ _ \\ \'_ ` _ \\/ __|'), nl,
                write('/\\/ /_ | ||  __/ | | | | \\__ \\'), nl,
                write('\\____/  \\__\\___|_| |_| |_|___/'), nl, nl,
                
                write('1. There are three type of equipments that you can use: Weapon, Armor, and Accessory.'), nl,
                write('2. Informations are usually classified, but for you, you can check its information with these commands: '), nl,
                write('   * Weapon Informations    : `weapon(weapon_name).`'), nl,
                write('   * Armor Informations     : `armor(armor_name).`'), nl,
                write('   * Accessory Informations : `accessory(accessory_name).`'), nl,
                write('3. Each items are made from different monsters\', or even gods\' blessings. Always use the strongest one that you can equip right away!'), nl,
                write('4. To ask for the effects of each weapons is very rude! Determine it yourself from your stats if you are using it!'), nl,
                write('5. To become powerful, suits yourself with your best items. To equip it, you can use the following commands: '), nl,
                write('   * Equip Weapon           : `equipWp(weapon_name).`'), nl,
                write('   * Equip Armor            : `equipArm(armor_name).`'), nl,
                write('   * Equip Accessory        : `equipAccs(accessory_name).`'), nl,
                write('6. If you want to unequip your equipments, use these and the item will be stored back to your bag if it still has empty spaces: '), nl,
                write('   * Unequip Weapon         : `unequipWp(weapon_name).`'), nl,
                write('   * Unequip Armor          : `unequipArm(armor_name).`'), nl,
                write('   * Unequip Accessory      : `unequipAccs(weapon_name).`'), nl,
                write('7. You can replace your current equipped items without having to unequip the old one first. Easy peasy, bois!'), nl, 
                write('8. There are five states of items. They give you different buffs for your stats! From lowest to highest: '), nl,
                write('   * |Ghost States|'), nl,
                write('   * |Demon States|'), nl,
                write('   * |Mamon States|'), nl,
                write('   * |Lucifer States|'), nl,
                write('   * |~&^*$%@)~(I*&T|'), nl.
                
potWiki :-      write('   ___      _   _             '), nl,
                write('  / _ \\___ | |_(_) ___  _ __  '), nl,
                write(' / /_)/ _ \\| __| |/ _ \\| \'_ \\ '), nl,
                write('/ ___/ (_) | |_| | (_) | | | |'), nl,
                write('\\/    \\___/ \\__|_|\\___/|_| |_|'), nl, nl,

                write('1. Potions are generous blessings from Gods that our best engineer refined once again, bringing the epitome of its value!'), nl,
                write('2. Remember, these potions will help you improve yourself, or even save you from dangers!'), nl,
                write('3. Boosts from potions are permanent! Only best potions are available in our territory~'), nl,
                write('4. There are 5 types of potions, each representing their buffs. They are:'), nl,
                write('   * |Health Potions|'), nl,
                write('   * |Attack Potions|'), nl,
                write('   * |Defense Potions|'), nl,
                write('   * |Magic Potions|'), nl,
                write('   * |Speed Potions|'), nl,
                write('5. Using the command `potion(potion_name).`, you can check informations of it. Truly awesome!'), nl,
                write('6. The only way to respect the Gods is to use the potion by drinking it all. Use `drink(potion_name).`'), nl.

mapWiki :-      write('  /\\/\\   __ _ _ __  ___ '), nl,
                write(' /    \\ / _` | \'_ \\/ __|'), nl,
                write('/ /\\/\\ \\ (_| | |_) \\__ \\'), nl,
                write('\\/    \\/\\__,_| .__/|___/'), nl,
                write('             |_| '), nl, nl,
                write('1.  The territory of ThryLos is very diversed, since it was the world of ThryLos affiliated together.'), nl,
                write('2.  There are 3 immersive regions with different characteristics. They are: '), nl,
                write('    * Birthright     : The origin that The Legends are born. It is a sacral and starting place for players.'), nl,
                write('    * Lost Evergreen : The massive forest of ThryLos, now lost and inhabited by the invading monsters. Take it back!'), nl,
                write('    * DragonLance    : The territory led by The Pinnacle of Dragons, ApeX. To the dungeon and you can kill him there!'), nl,
                write('3.  Each regions will have different enemies generated. The easiest enemies are of course located in the starting place.'), nl,
                write('4.  The higher-ups are now focusing on taking back The Lost Evergreen and DragonLance. That\'s why Birthright has very little technologies there!'), nl,
                write('5.  On the border of each regions, there are boundary walls made by previous Legends in order to prevent monsters from other region to flood in.'), nl,
                write('6.  You can use the command `map.` to show the map you are currently in. The NVGXor will also display the legends of the map below it.'), nl,
                write('7.  While you travel across the map, you might encounter some monsters. Kill and loot things from them to get more powerful!'), nl,
                write('8.  You can\'t go to the coordinates that have walls. Don\'t waste your energy trying it!'), nl,
                write('9.  You can interact with map objects by going to the coordinate it is placed in. You can reenter by going out and in again.'), nl,
                write('10. You can teleport within the regions. If the destination is map object, the effects of each object is activated automatically.'), nl,
                write('11. You can move manually to the next or previous region by going to the `<` or `>` map object. Don\'t stay too long in one region!'), nl,
                write('12. The magic words that you can use to move across the map: '), nl,
                write('    * Going Forward  : `w`'), nl,
                write('    * Turning Left   : `a`'), nl,
                write('    * Going Backward : `s`'), nl,
                write('    * Turning Right  : `d`'), nl.

storeWiki :-    write(' __ _                 '), nl,
                write('/ _\\ |_ ___  _ __ ___ '), nl,
                write('\\ \\| __/ _ \\| \'__/ _ \\'), nl,
                write('_\\ \\ || (_) | | |  __/'), nl,
                write('\\__/\\__\\___/|_|  \\___|'), nl, nl,
                write('1. The Almighty ThryStore has been there forever, and has been selling high quality potions and equipments.'), nl,
                write('2. Use the map to know where the ThryStore branch is in the region you are currently in.'), nl,
                write('3. Navigate to the Store to use to the store. You will only have to enter numbers of your choice to use the store.'), nl,
                write('4. You can buy potions immediately in the store. Make sure you have the stocks of it or it will be dangerous for you!'), nl,
                write('5. You can\'t buy equipments. Instead, use the Gacha to get new equipments. Don\'t rage on it if you don\'t get the items you want!'), nl,
                write('6. There are 5 Gacha systems in the store: '), nl,
                write('   * Standard : Highest rate on Ghost Grade Equipments.'), nl,
                write('   * Silver   : Lower rate on Ghost Grade, but higher on other grades.'), nl,
                write('   * Gold     : Even lower on Ghost, also higher on other grades.'), nl,
                write('   * Gambler  : Contains Mamon and God Grade only, but 50% chance on getting nothing.'), nl.

enemyWiki   :-  write('   __                     _ '), nl,
                write('  /__\\ __   ___ _ __ ___ (_) ___  ___ '), nl,
                write(' /_\\| `_ \\ / _ \\ `_ ` _ \\| |/ _ \\/ __|'), nl,
                write('//__| | | |  __/ | | | | | |  __/\\__ \\'), nl,
                write('\\__/|_| |_|\\___|_| |_| |_|_|\\___||___/'), nl, nl,

                write('1. There are five types of enemy monsters that scattered all over the land of ThryLos: Slime, Goblin, Wolf, Spider, and Zool'), nl,
                write('2. This is the best information that can be gathered from all the people of ThryLos. All just for you, our mighty saviour!'), nl,
                write('   * |Slime|'), nl,
                write('     This is the weakest monsters of all out there. Some said that this slimy things are made from Apex\'s sweat.'), nl,
                write('     A little of advice for you: This type of enemy is very useful to get some exp and gold for early levels!'), nl,
                write('   * |Goblin|'), nl,
                write('     Goblin is quite a troublesome enemy because they are well equipped with their selfmade armor,'), nl,
                write('     their defense is nearly equal with their attack.'), nl,
                write('   * |Wolf|'), nl,
                write('     Always be careful when you strolling over this land, because some wolfs are out there lurking for you'), nl,
                write('     Pay enough attention when you face them, because their speed is high enough before you can even blink!'), nl,
                write('   * |Spider|'), nl,
                write('     This scary giant spiders can be very dangerous. You have to look your surrounding! Who knows you can be walking under them.'), nl,
                write('     Their fangs are the scariest one, be careful not to get bitten!'), nl,
                write('   * |Zool|'), nl,
                write('     The champion monster of ThryLos. Their attack and defense is high enough to beat you'), nl,
                write('     It is really hard to find them but you have to be well prepared when you face them!'), nl,
                write('3. And finally the last enemy you have to beat to save the land of ThryLos: Apex.'), nl,
                write('   There is not much information because people are too scared to get close.'), nl,
                write('4. Remember to always be careful and pay attention to your surrounding because you don\'t know when the monsters will attack you!'), nl.


questWiki   :-  write('    __                   _'), nl,
                write('  / __ \\                | |  '), nl,
                write(' | |  | |_   _  ___  ___| |_ '), nl,
                write(' | |  | | | | |/ _ \\/ __| __|'), nl,
                write(' | |__| | |_| |  __/\\__ \\ |_ '), nl,
                write('  \\___\\_\\\\__,_|\\___||___/\\__|'), nl, nl,
                write('1. Quest can be accessed when you reach the `Q` point in map.'), nl,
                write('2. When you reach that point, a window will automatically pop up for you to choose your Quest.'), nl,
                write('3. The Quest and Quest reward will be generated according to your difficulty choice, and character level.'), nl,
                write('4. You can only have 1 Quest at a single time.'), nl,
                write('5. If you want to check your progress, you can simply type `quest.`.'), nl,
                write('6. You will get the Quest reward as soon as you finish it, wherever you are currently.'), nl.
