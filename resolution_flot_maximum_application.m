% Résolution du problème du flot maximum pour un réseau de transport
% à la page 47

function [] = resolution_flot_maximum_application()

% Modélisation du réseau
% le graphe utilisé est celui de la page 47

% le point de départ et d'arrivée
depart = 1;
arrivee = 10;

% l'ensemble des sommets du graphe
sommets = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

% le nombre de successeurs de chaque sommet
pointeurs = [4, 2, 5, 3, 3, 2, 1, 3, 1, 0];

% la liste des successeurs de chaque sommet
successeurs = [2, 3, 4, 5, ... % pour le sommet 1
               6, 7, ... % pour le sommet 2
               2, 4, 6, 7, 8, ... % etc ...
               7, 8, 9, ...
               4, 8, 9, ...
               7, 10, ...
               10, ...
               7, 9, 10, ...
               10 ... % pour le sommet 9
               ]; % pour le sommet 10

% les capacités correspondantes à chaque arc !
capacites = [10, 20, 10, 10, ... % pour le sommet 1
             8, 4, ... % etc ...
             3, 5, 5, 7, 3, ...
             6, 1, 7, ...
             4, 5, 2, ...
             2, 10, ...
             10, ...
             3, 5, 20, ...
             10 ...
             ]; % pour le sommet 10
           
flotMaximum = FFflot(depart, arrivee, sommets', capacites, successeurs, pointeurs);

% Affichage du flot de chaque arc
for arc = 1:size(flotMaximum, 2)
    [sommet_precedant, sommet_suivant] = getArcExtremites(arc, successeurs, pointeurs);
    disp("Flot sur l'arc " + sommet_precedant + " -> " + sommet_suivant + " = " + flotMaximum(arc));
end

end

