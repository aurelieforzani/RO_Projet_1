function [ sommets ] = getSommetAvants( pointeurs, successeurs,s )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
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

