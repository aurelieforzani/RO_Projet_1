function[indice] = getIndSucc(pointeur,sommet)
% retourne les indices de début et de fin des arcs sortant de Sommet dans
% Successeurs
%% ENTREE
% pointeur : tableaux du nombre d'arcs sortant pour chaque sommet
% sommet : sommet dont on cherche les arcs sortant

%% SORTIE
% indice : tableau 1*2 contenant l'indice du premier arc sortant et du
% dernier arc sortant

%% Note : l'indice du sommet dans Sommets est aussi la valeur du Sommet
%% DEBUT DE LA FONCTION

indice(1)=1; % indice du premier arc partant de Sommet
for i = 1:sommet-1
   indice(1) = indice(1) + pointeur(i);
end
%indice du dernier arc partant de Sommet
indice(2) = indice(1) + pointeur(sommet) - 1;
return;
