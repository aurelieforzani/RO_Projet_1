function[indSommet] = getIndSommet(sommets,sommet)
% retourne l'indice de Sommet dans Sommets
% 
%% EN ENTREE
% sommets : liste ordonée des noms de tous les sommets
% sommet : nom du sommet dont on veut l'indice
%% EN SORTIE
%  indSommet : indice de Sommet dans sommets
%% DEBUT DU PROGRAMME
ind = 1; % indice de parcours initialisé à 1
% Tant que on ne trouve pas Sommet dans sommets, on regarde l'élément
% suivant jusqu'à tous les avoir parcourru.
while ((ind <= size(sommets,2)) && (sommets(ind) ~= sommet))
    ind = ind + 1;
end

% Si tout sommets est parcouru, afficher message d'erreur
if (ind > size(sommets,2))
    disp('Sommet non présent dans la liste des sommets');
% Sinon, retourné l'indice correspondant
else
    indSommet = ind;
    return;
end