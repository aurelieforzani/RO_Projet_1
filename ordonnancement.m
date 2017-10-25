function [valeurTensionCritique, cheminCritique, matriceActivite] = ordonnancement(depart, arrivee, successeur, capacite, pointeurs, sommets)
%% ORDONNANCEMENT : trouve le chemin permettant de finir les travaux le plus rapidement possible
%% EN ENTREE : 
% depart : sommet de départ du graphe
% arrivee : sommet d'arrivee du graphe
% Capacité : capacité (délai entre chaque travaux de chaque arc)
% pointeurs : pointeurs : nombre de successeurs de chaque sommets
% successeur : sommets pointés par des arcs
% sommets : les sommets du graphe

%% EN SORTIE
% valeurTensionCritique : Tension maximale associée au chemin critique
% (temps pour finir les travaux)
% cheminCritique : chemin permettant de finir les travaux au plus vite
% matrice activité : temps de démarage au plus tot et au plus tard de
% chaque travaux

%% T : Temps de démarrage au plus tot de chaque sommet
T = zeros(1,size(pointeurs,2));

%% Calcul du temps de démarrage au plus tot pour chaque travaux
for i = 1:size(pointeurs,2)
    sommetsSuivants = getSommetsSuivants(pointeurs,successeur,i);
    % On regarde si le travail rallonge le temps de démarrage de ses successeurs
    for j = sommetsSuivants
        indArc = getIndArc(i, j, pointeurs, successeur);
        % Le délai(capacité) entre j et i rallonge le temps de démarrage au plus tot
        if (T(j) - T(i)) <= capacite(indArc)
            % Nouveau temps au plus tot
            T(j) = capacite(indArc) + T(i);
        end
    end
end

%% Etablissement du chemin critique
cheminCritique = [arrivee];
valeurTensionCritique = T(arrivee);
sommet = arrivee;
while (sommet ~= depart)
    sommetsPrecedents = getSommetsAvant(pointeurs',successeur',sommet);
    ind = 1;
    indArc = getIndArc(sommetsPrecedents(ind), sommet, pointeurs, successeur);
    % choix du meilleur arc pour rejoindre sommet
    while ((T(sommet) - capacite(indArc)) ~= T(sommetsPrecedents(ind)))
        ind = ind+1;
        indArc = getIndArc(sommetsPrecedents(ind), sommet, pointeurs, successeur);
    end
    sommet = sommetsPrecedents(ind);
    cheminCritique = [sommet  cheminCritique];
end

%% Création de matriceActivite
matriceActivite = zeros(2,size(pointeurs,2));
% Le temps minimum pour lancer une activité correspond a T
matriceActivite(1,:) = T;
% Les activités appartenant au chemin critique doivent être lancé a leur
% valeur dans T
matriceActivite(2,cheminCritique) = T(cheminCritique)

% Création de Parcours, la liste des sommets n'appartenants pas au chemin
% critique
Parcours = [depart:arrivee];
Parcours = setdiff(Parcours,cheminCritique);
% On parcours ces sommets, et pour chacun, on calcule le temps maximum
% auquel le lancer pour effectuer toutes les activités en un temps minimum.
% Pour cela, on calcule la valeur du plus grand chemin de ce sommet à
% l'arrivé, et on l'enlève à notre valeur de Tension critique.
for k = Parcours
    matriceActivite(2,k) = valeurTensionCritique - getTensionsCritiques(k, arrivee, successeur, capacite, pointeurs, sommets);
end



