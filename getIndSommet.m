function[indSommet] = getIndSommet(Sommets,Sommet)
% retourne l'indice de Sommet dans Sommets
% 
%% EN ENTREE
% Sommets : liste ordonée des noms de tous les Sommets
% Sommet : nom du Sommet dont on veut l'indice
%% EN SORTIE
%  indSommet : indice de Sommet dans Sommets
%% DEBUT DU PROGRAMME
ind = 1; % indice de parcours initialisé à 1
% Tant que on ne trouve pas Sommet dans Sommets, on regarde l'élément
% suivant jusqu'à tous les avoir parcourru.
while ((ind <= size(Sommets,2)) && (Sommets(ind) ~= Sommet))
    ind = ind + 1;
end

% Si tout Sommets est parcouru, afficher message d'erreur
if (ind > size(Sommets,2))
    disp('Sommet non présent dans la liste des sommets');
% Sinon, retourné l'indice correspondant
else
    indSommet = ind;
    return;
end