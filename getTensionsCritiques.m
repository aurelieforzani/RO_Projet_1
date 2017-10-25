
function [valeurTensionCritique] = getTensionsCritiques(depart, arrivee, successeur, capacite, pointeurs, sommets)
%% EN ENTREE : 
% depart : sommet de départ du graphe
% arrivee : sommet d'arrivee du graphe
% Capacité : capacité (délai entre chaque travaux de chaque arc)
% pointeurs : pointeurs : nombre de successeurs de chaque sommets
% successeur : sommets pointés par des arcs
% sommets : les sommets du graphe

%% EN SORTIE
% valeurTensionCritique : Tension maximale associée au chemin maximale de
% Départ à Arrivée

%% capaciteAux :
% On enlève au maximum de capacite, les valeurs de capacite. 
% Ainsi, les capacités restent positives. Mais l'ordre de grandeur est
% inversé, la plus petite devient la plus grande.
% Donc le plus court chemin, devient ici le plus grand chemin par
% FFTension.
capaciteAux = max(capacite)-capacite;
[ValeurTensionMinimale, CheminTensionMinimale] = FFTension(depart, arrivee, successeur, capaciteAux, pointeurs, sommets);

%% Calcule de la valeur de tension associé à ce chemin critique.
valeurTensionCritique = 0;
for k = 1:size(CheminTensionMinimale,2)-1
   indArc = getIndArc(CheminTensionMinimale(k),CheminTensionMinimale(k+1) , pointeurs, successeur);
   valeurTensionCritique = valeurTensionCritique + capacite(indArc);
end
return
end

