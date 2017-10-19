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
listeCheminDepartArrivee = getCheminsDepartArrivee(Depart, Arrivee, Sommets, Pointeurs, Successeurs);

%% TO REMOVE
%Pour tous les chemins, on regarde si on peux le surcharger de 1, si oui on
%le surcharge de 1 et on recommence, sinon on passe au sommet suivant.
%%

% Pour tous les chemins, on le charge de flot d'un seul coup pour le saturer
% directement. Puis on passe au chemin suivant

for chemin = listeCheminDepartArrivee
    %% TO REMOVE
    %peuxSurcharger = true si on peux surcharger le chemin et false sinon
    peuxSurcharger = true;
    %%
    
    % la quantité de flot dont on va surcharger chaque chemin
    flotAajouter = 0;
    
    %% TO REMOVE
    %On positione la valeur de peuxSurcharger
    %Pour toutes les capacitées du chemin, on regarde si on peux monter le
    %flot de 1.
    %%
    
    %Liste des indices des arcs du chemin courant
    IndArcsChemin = getIndArcChemin(chemin);
    for i = IndArcsChemin
        peuxSurcharger = peuxSurcharger && Flots(i) < Capacite(i);
        % On ne pourra ajouter que la différence minimum entre la capacité
        % maximale d'un arc et son flot maximal
        flotAajouter = min(flotAajouter, Capacite(i) - Flots(i));
    end
    
    for i = IndArcsChemin
        Flots(i) = Flots(i) + flotAajouter;
    end
    
    %% TO REMOVE
%     while (peuxSurcharger)
%         
%         %On surcharge le chemin 
%         for i=IndArcsChemin
%             Flots(i) = Flots(i) + 1;
%         end
%         
%         %Positionnement de peuxSurcharger
%         for i=IndArcsChemin
%             peuxSurcharger = peuxSurcharger && Flots(i) < Capacite(i);
%         end
%     end 
    %%
end















end