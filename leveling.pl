/* leveling.pl */

/* Definisi Add EXP */

:- dynamic(exp/2).
addExp(X, Add) :-       exp(X, PrevEXP), retract(exp(X, PrevEXP)), 
                        NewEXP is PrevEXP + Add, asserta(exp(X, NewEXP)),
                        level(X, Level),
                        write(Add), write(' Experience earned!'), nl,
                        
                        (Level < 2, NewEXP >= 100 -> retract(level(X, _)),
                        asserta(level(X, 2)),
                        write('You just leveled up to level 2!'), nl,
                        addStats(X, 2);
                        write('')),

                        (Level < 3, NewEXP >= 250 -> retract(level(X, _)),
                        asserta(level(X, 3)),
                        write('You just leveled up to level 3!'), nl,
                        addStats(X, 3);
                        write('')),

                        (Level < 4, NewEXP >= 500 -> retract(level(X, _)),
                        asserta(level(X, 4)),
                        write('You just leveled up to level 4!'), nl,
                        addStats(X, 4);
                        write('')),

                        (Level < 5, NewEXP >= 750 -> retract(level(X, _)),
                        asserta(level(X, 5)),
                        write('You just leveled up to level 5!'), nl,
                        addStats(X, 5);
                        write('')),

                        (NewEXP >= 2000 -> retract(level(X, _)),
                        asserta(level(X, 6)), addStats(X, 6),
                        write('You hit max level! Your name shall be engraved in history!'), nl;
                        write('')),
                        
                        write('Don\'t stop and keep getting stronger! We can\'t predict the future!'), nl.

/* Definisi Add Stats */

addStats(X, NewLevel) :-    (NewLevel is 2 -> retract(attack(X, PAtt)), NAtt is PAtt + 2, asserta(attack(X, NAtt)),
                            retract(defense(X, PDef)), NDef is PDef + 2, asserta(defense(X, NDef)),
                            retract(health(X, PHeal)), NHeal is PHeal + 2, asserta(health(X, NHeal)),
                            retract(magic(X, PMag)), NMag is PMag + 2, asserta(magic(X, NMag)),
                            retract(speed(X, PSpd)), NSpd is PSpd + 2, asserta(speed(X, NSpd));

                            NewLevel is 3 -> retract(attack(X, PAtt)), NAtt is PAtt + 3, asserta(attack(X, NAtt)),
                            retract(defense(X, PDef)), NDef is PDef + 3, asserta(defense(X, NDef)),
                            retract(health(X, PHeal)), NHeal is PHeal + 3, asserta(health(X, NHeal)),
                            retract(magic(X, PMag)), NMag is PMag + 3, asserta(magic(X, NMag)),
                            retract(speed(X, PSpd)), NSpd is PSpd + 3, asserta(speed(X, NSpd));
                            
                            NewLevel is 4 -> retract(attack(X, PAtt)), NAtt is PAtt + 5, asserta(attack(X, NAtt)),
                            retract(defense(X, PDef)), NDef is PDef + 5, asserta(defense(X, NDef)),
                            retract(health(X, PHeal)), NHeal is PHeal + 5, asserta(health(X, NHeal)),
                            retract(magic(X, PMag)), NMag is PMag + 5, asserta(magic(X, NMag)),
                            retract(speed(X, PSpd)), NSpd is PSpd + 5, asserta(speed(X, NSpd));

                            NewLevel is 5 -> retract(attack(X, PAtt)), NAtt is PAtt + 7, asserta(attack(X, NAtt)),
                            retract(defense(X, PDef)), NDef is PDef + 7, asserta(defense(X, NDef)),
                            retract(health(X, PHeal)), NHeal is PHeal + 7, asserta(health(X, NHeal)),
                            retract(magic(X, PMag)), NMag is PMag + 7, asserta(magic(X, NMag)),
                            retract(speed(X, PSpd)), NSpd is PSpd + 7, asserta(speed(X, NSpd));

                            retract(attack(X, PAtt)), NAtt is PAtt + 10, asserta(attack(X, NAtt)),
                            retract(defense(X, PDef)), NDef is PDef + 10, asserta(defense(X, NDef)),
                            retract(health(X, PHeal)), NHeal is PHeal + 10, asserta(health(X, NHeal)),
                            retract(magic(X, PMag)), NMag is PMag + 10, asserta(magic(X, NMag)),
                            retract(speed(X, PSpd)), NSpd is PSpd + 10, asserta(speed(X, NSpd))).