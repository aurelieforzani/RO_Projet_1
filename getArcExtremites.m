function [ sommetPrecedent, sommetSuivant ] = getArcExtremites( indArc, successeurs, pointeurs)

% Renvoie les sommets à chaque extrémité d'un arc
%% EN ENTREE
% indArc est l'indice de l'arc comme défini pour successeurs et capacités
% successeurs est la liste des successeurs de chaque sommet du graphe
% pointeurs est le nombre de successeurs de chaque sommet du graphe

%% EN SORTIE
% sommet_precedent est l'indice du sommet précédant cet arc
% sommet_suivant est l'indice du sommet à la fin de cet arc

%% DEBUT DE LA FONCTION
% par définition de successeurs
sommetSuivant = successeurs(indArc);

% cherchons le sommet précédent !
n = size(pointeurs, 2);

% on part du premier sommet
tmp = indArc;
i = 1;

% et tant qu'on peut retirer des arcs à l'indice
while i <= n & tmp > 0
    % alors on le fait
    tmp = tmp - pointeurs(i);
    i = i + 1;
end

% quand on ne peut plus, c'est qu'on a trouvé l'indice de l'arc précédent
sommetPrecedent = i - 1;

end

