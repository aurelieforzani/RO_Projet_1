% Résolution du problème d'ordonnancement
% Comme nous n'avions pas de graphe à résoudre, nous avons créé notre
% propre graphe

function [] = resolution_ordonnancement_application()

% Modélisation du réseau
% le graphe utilisé a été inventé

% le point de départ et d'arrivée
depart = 1;
arrivee = 11;

% l'ensemble des sommets du graphe
sommets = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];

% le nombre de successeurs de chaque sommet
pointeurs = [3, 1, 3, 2, 2, 3, 2, 1, 1, 1, 0];

% la liste des successeurs de chaque sommet
successeurs = [2, 3, 4, ... % pour le sommet 1
               5, ... % pour le sommet 2
               5, 6, 7, ... % etc ...
               7, 9, ...
               9, 10, ...
               8, 9, 10, ...
               8, 10, ...
               11, ...
               11, ...
               11 ... % pour le sommet 10
               ]; % pour le sommet 11

% les capacités correspondantes à chaque arc !
capacites = [5, 0, 3,... % pour le sommet 1
             16, ... % etc ...
             14, 14, 14, ...
             20, 10, ...
             8, 8, ...
             18, 18, 18, ...
             25, 25, ...
             15, ...
             17, ...
             10 ...
             ]; % pour le sommet 11
           
% On applique l'algorithme d'ordonnancement
[valeurTensionCritique, cheminCritique, matriceActivite] = ordonnancement(depart, arrivee, successeurs, capacites, pointeurs, sommets);

% Affichage des résultats
disp("La valeur de la tension critique est de " + valeurTensionCritique);
str = "Voici le chemin critique " + cheminCritique(1);
size_chemin = size(cheminCritique, 2);
for x=cheminCritique(1, 2:size_chemin)
    str = str + " -> " + x;
end
% On affiche enfin la chaîne
disp(str);

for i=1:size(matriceActivite, 2)
    valMin = matriceActivite(1, i);
    valMax = matriceActivite(2, i);
    disp("Le sommet " + i + " peut commencer au mieux à " + valMin + " et au plus tard à " + valMax);
end

