function[SommetsSuivants] = getSommetsSuivants(Pointeur,Successeurs,Sommet)
% retourne la liste des sommets atteignables directement par Sommet

%% EN ENTREE
%  
%
%% EN SORTIE
%  x : vecteur des valeurs des variables maximisant la valeur du critère.
%  F : valeur optimale du critere.
%% DEBUT DU PROGRAMME
SommetsSuivants = [];

indSucc = getIndSucc(Pointeur,Sommet);

i = indSucc(1);
j = indSucc(2);

ind = 1;
for k = i:j
    SommetsSuivants(ind) = Successeurs(k);
    ind = ind + 1;
end
return;