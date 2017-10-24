%% Graphe d'exemple et de test pour l'ordonnancement

Depart = 1;
Arrivee = 11;
Successeur = [2,3,4,5,5,6,7,7,9,8,10,8,9,10,8,10,11,11,11];
Capacite = [5,0,3,16,14,14,14,20,10,8,8,18,18,18,25,25,15,17,10];
Pointeurs = [3,1,3,2,2,3,2,1,1,1,0];
Sommets = uint16(Depart:Arrivee);