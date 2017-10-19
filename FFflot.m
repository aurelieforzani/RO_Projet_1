function [  ] = FFFLot( poidsArcs, sommetsArc, listeSommets)
% Résoudre un problème de flot maximal avec l'algorithme de Ford Fulkerson
%% EN ENTREE
% poidsArcs : représente pour chaque arc, le poids de l'arc
% sommetsArcs : représente pour cahque arcs, le sommet de départ et
%   d'arrivée
%% Phase de marquage
marques = Marquage(flot, source, puit, sommets, capacite, successeurs, pointeurs);
% sommetsMarques : représente pour chaque sommet, la manière dont il est
%   marqué
% listeSommets : représente la liste des sommets avec leur nom

%% EN SORTIE


%% Phase de saturation
Flots = Saturation(Sommets, Capacite, Successeurs, Pointeurs);

%% Phase d'amélioration
flots = Amelioration( puits, source , sommets, marques, pointeurs, successeurs);

end

