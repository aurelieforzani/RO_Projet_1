function[SommetsSuivants] = getSommetsSuivants(pointeur,successeurs,sommet)
% retourne la liste des sommets atteignables directement par Sommet

%% EN ENTREE
% pointeur : liste du nombre d'arcs sortant par sommet
% successeurs : listte des successeurs de chaque sommet
% sommet : sommet dont on cherche les successeurs

%% EN SORTIE
%  x : vecteur des valeurs des variables maximisant la valeur du critère.
%  F : valeur optimale du critere.
%% DEBUT DU PROGRAMME
SommetsSuivants = [];

%indices du premier et du dernier arc de Sommet
indSucc = getIndSucc(pointeur,sommet);

debutArc = indSucc(1);
finArc = indSucc(2);

ind = 1;
%récupérer les Sommets suivants
for k = debutArc:finArc
    SommetsSuivants(ind) = successeurs(k);
    ind = ind + 1;
end
return;