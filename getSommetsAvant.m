function [ sommets ] = getSommetsAvant( pointeurs, successeurs,s )
%% Renvoie les sommets prédecesseur du sommet s
%% EN ENTREE :
% pointeurs : liste du nombre d'arc sortant de chaque sommet
% successeurs : liste des sommets successeurs de chaque sommet
% s : sommet dont on cherche les predecesseurs
%% EN SORTIE
% sommets : liste des sommets prédecesseurs de s

%% DEBUT DE LA FONCTION
sommets = [];
indices = [];
for(i=1:size(successeurs))
    %vérifier si s est un succsesseur
    if(successeurs(i) == s)
        %stocker son indice
        indices = [indices, i];
    end
end

%chercher chaque predesseceur
for(i=indices)
    sommePointeurs = 0;
    j = 1;
   while(sommePointeurs < i)
       sommePointeurs = sommePointeurs + pointeurs(j);
       j = j + 1;
   end
   sommets = [sommets,j-1];
end
end

