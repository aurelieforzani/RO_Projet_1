function[SommetsSuivants] = getSommetsSuivants(Pointeur,Successeurs,Sommet)
% retourne la liste des sommets atteignables directement par Sommet

%% EN ENTREE
% Pointeur : liste du nombre d'arcs sortant par sommet
% Successeurs : listte des successeurs de chaque sommet
% Sommet : sommet dont on cherche les successeurs

%% EN SORTIE
%  x : vecteur des valeurs des variables maximisant la valeur du critère.
%  F : valeur optimale du critere.
%% DEBUT DU PROGRAMME
SommetsSuivants = [];

%indices du premier et du dernier arc de Sommet
indSucc = getIndSucc(Pointeur,Sommet);

debutArc = indSucc(1);
finArc = indSucc(2);

ind = 1;
%récupérer les Sommets suivants
for k = debutArc:finArc
    SommetsSuivants(ind) = Successeurs(k);
    ind = ind + 1;
end
return;