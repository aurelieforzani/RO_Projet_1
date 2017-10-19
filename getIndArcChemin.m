function [indArcChemin] = getIndArcChemin(chemin, pointeurs, successeurs)
%% Retourne la liste des indices dans successeurs, flots et capacités des
% arcs composant le chemin fourni en entrée

%% EN ENTREE
%chemin : vecteur d'entiers, liste des sommets composant le chemin
%pointeurs : vecteur d'entiers, contenant le nombre de sommets vers lesquels pointe
%chaque sommets du graphe
%successeurs : vecteur d'entiers, contenant les successeurs de chaque sommets;

%% EN SORTIE
%IndArcChemin : vecteur d'entiers, liste des indices dans successeurs des
%arcs composant le chemin.
%
%% DEBUT DE LA FONCTION
    indArcChemin = zeros(size(chemin) -[0,1]);
    size(chemin,2)
    for i = 1: (size(chemin,2) -1 )
        indArcChemin(i) = getIndArc(chemin(i), chemin(i+1), pointeurs, successeurs)
    end
end

