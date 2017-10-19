function[SommetsSuivants] = getSommetsSuivants(Pointeur,Successeurs,Sommets,Sommet)
% retourne la liste des sommets ateignables directement par Sommet

%% EN ENTREE
%  
%
%% EN SORTIE
%  x : vecteur des valeurs des variables maximisant la valeur du critère.
%  F : valeur optimale du critere.
%% DEBUT DU PROGRAMME
SommetsSuivants = [];

indSucc = getIndSucc(Pointeur,Sommets,Sommet);

i = indSucc(1);
j = indSucc(2);

ind = 1;
for k = i:j
    SommetsSuivants(ind) = Successeurs(k);
    ind = ind + 1;
end
return;