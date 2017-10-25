
function [valeurTensionCritique] = getTensionsCritiques(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)
%% EN ENTREE : 
% Depart : sommet de départ du graphe
% Arrivee : sommet d'arrivee du graphe
% Capacité : capacité (délai entre chaque travaux de chaque arc)
% Pointeurs : Pointeurs : nombre de successeurs de chaque sommets
% Successeur : sommets pointés par des arcs
% Sommets : les sommets du graphe

%% EN SORTIE
% valeurTensionCritique : Tension maximale associée au chemin maximale de
% Départ à Arrivée

%% CapaciteAux :
% On enlève au maximum de Capacite, les valeurs de Capacite. 
% Ainsi, les capacités restent positives. Mais l'ordre de grandeur est
% inversé, la plus petite devient la plus grande.
% Donc le plus court chemin, devient ici le plus grand chemin par
% FFTension.
CapaciteAux = max(Capacite)-Capacite;
[ValeurTensionMinimale, CheminTensionMinimale] = FFTension(Depart, Arrivee, Successeur, CapaciteAux, Pointeurs, Sommets);

%% Calcule de la valeur de tension associé à ce chemin critique.
valeurTensionCritique = 0;
for k = 1:size(CheminTensionMinimale,2)-1
   indArc = getIndArc(CheminTensionMinimale(k),CheminTensionMinimale(k+1) , Pointeurs, Successeur);
   valeurTensionCritique = valeurTensionCritique + Capacite(indArc);
end
return
end

