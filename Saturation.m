%%Fonction qui permet de réaliser la saturation du graphe

% Depart : le sommet de départ dans la liste des Sommets
% Arrivee: le sommet d'arrivée dans la liste des Sommets
% Sommets : le tableau des sommets du graphe
% Capacite : le tableau des capacitées des arcs
% Successeurs : Le tableaux des successeurs des sommets
% Pointeurs : la liste des pointeurs d'arcs

% Retourne Flots : le tableau des flots des arcs

function [Flots] = Saturation(Depart, Arrivee, Sommets, Capacite, Successeurs, Pointeurs)

% On part d'un flot réalisable -> Le flot nul
Flots = zeros(size(Capacite));

% On améliore le flot pour le rendre complet

% On récupère la liste des chemins qui permettent d'atteindre le point
% d'arrivée depuis le point de départ
listeCheminDepartArrivee = getCheminsDepartArrivee(Depart, Arrivee, Pointeurs, Successeurs);

%Pour tous les chemins, on regarde si on peux le surcharger de 1, si oui on
%le surcharge de 1 et on recommence, sinon on passe au sommet suivant.
for chemin = listeCheminDepartArrivee'
    chemin = getChemin(chemin, Arrivee);
    %     %peuxSurcharger = true si on peux surcharger le chemin et false sinon
    
    %On positione la valeur de peuxSurcharger
    %Pour toutes les capacitées du chemin, on regarde si on peux monter le
    %flot de 1.
    %%
    
    %Liste des indices des arcs du chemin courant
    IndArcsChemin = getIndArcChemin(chemin', Pointeurs, Successeurs);
    
        minFlot = Inf;
        
        %On surcharge le chemin 
        for i=IndArcsChemin'
            minFlot = min(minFlot, Capacite(i) - Flots(i));
        end
        
        for i=IndArcsChemin'
            Flots(i) = Flots(i) + minFlot;
        end
        
end

end