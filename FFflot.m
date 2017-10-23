function [ flot ] = FFfLot(source, puits, sommets, capacite, successeurs, pointeurs)
% Résoudre un problème de flot maximal avec l'algorithme de Ford Fulkerson
%% EN ENTREE
% poidsArcs : représente pour chaque arc, le poids de l'arc
% sommetsArcs : représente pour cahque arcs, le sommet de départ et
%   d'arrivée

% sommetsMarques : représente pour chaque sommet, la manière dont il est
%   marqué
% listeSommets : représente la liste des sommets avec leur nom

%% EN SORTIE


%% Phase de saturation
flot = Saturation(source, puits, sommets, capacite, successeurs, pointeurs);

%% Phase de marquage
marques = Marquage(flot, source, puits, sommets, capacite, successeurs, pointeurs);

%% Phase d'amélioration
flot = Amelioration( puits, source , sommets, marques, pointeurs, successeurs, flot, capacite);

return
end

