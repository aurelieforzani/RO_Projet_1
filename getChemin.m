function[chemin] = getChemin(ligne,arrivee)
%% Renvoie le chemin désigné par ligne, qui se termine à arrivee
%% EN ENTREE
% ligne : vecteur des sommets qui constituent le chemin
% arrivee : sommet de fin de chemin

%% EN SORTIE 
% chemin : chemin de la bonne forme jusqu'à arrivee

%% DEBUT DE LA FONCTION
    ind = 1;
    %récupérer l'indice d'arrivee
    while (ligne(ind) ~= arrivee)
        ind = ind + 1;
    end
    chemin = ligne(1:ind);
    return;
end