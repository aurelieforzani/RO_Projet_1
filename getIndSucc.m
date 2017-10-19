function[indice] = getIndSucc(Pointeur,Sommets,Sommet)
% retourne les indices de début et de fin des arcs partant de Sommet dans
% Successeurs
indSommet = getIndSommet(Sommets,Sommet);

indice(1)=1; 
for i = 1:indSommet-1
   indice(1) = indice(1) + Pointeur(i);
end
indice(2) = indice(1) + Pointeur(indSommet) - 1;
return;
