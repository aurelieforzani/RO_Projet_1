function [ indArc] = getIndArc(indDepart, indArrivee, pointeurs, successeurs, sommets )
%% EN ENTREE
%indDepart : entier, indice dans sommets et dans pointeurs du sommet de depart de
%l'arc
%indArrivee : entier, indice dans sommets et dans pointeurs du sommet d'arrivée de
%l'arc
%pointeurs : vecteur, contenant le nombre de sommets vers lesquels pointe
%chaque sommets du graphe
%successeurs : vecteur, contenant les successeurs de chaque sommets;
%sommets : vecteur, contenant tous les sommets du graphe

%% EN SORTIE
%Retourne l'indice correspondant à l'arc entre le sommet d'indice
%indDepart et le sommet d'indice indArrivee dans Pointeur
% 
%indArc : entier, indice dans flots, successeurs et capacités de l'arc que l'on recherche

%% DEBUT DE LA FONCTION


indArc = sum(pointeurs(1:(indDepart-1),1),1) + 1;

while(successeurs(indArc,1) ~= indArrivee)
    indArc = indArc + 1;

end

% !!!! sommets ne sert à rien