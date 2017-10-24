function [valeurTensionCritique, cheminCritique, MatriceActivite] = ordonnancement2(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)

% https://www.youtube.com/watch?v=lRCAIbrfQGM

T = zeros(1,size(Pointeurs,2));

for i = 1:size(Pointeurs,2)
    sommetsSuivants = getSommetsSuivants(Pointeurs,Successeur,i);
    for j = sommetsSuivants
        indArc = getIndArc(i, j, Pointeurs, Successeur);
        if (T(j) - T(i)) <= Capacite(indArc)
            T(j) = Capacite(indArc) + T(i);
        end
    end
end

cheminCritique = [Arrivee];
valeurTensionCritique = T(Arrivee)
sommet = Arrivee;
while (sommet ~= Depart)
    sommetsPrecedents = getSommetAvants(Pointeurs',Successeur',sommet);
    ind = 1;
    indArc = getIndArc(sommetsPrecedents(ind), sommet, Pointeurs, Successeur);
    while ((T(sommet) - Capacite(indArc)) ~= T(sommetsPrecedents(ind)))
        ind = ind+1;
        indArc = getIndArc(sommetsPrecedents(ind), sommet, Pointeurs, Successeur);
    end
    sommet = sommetsPrecedents(ind);
    cheminCritique = [sommet  cheminCritique];
end

MatriceActivite = zeros(2,size(Pointeurs,2));
% Le temps minimum pour lancer une activité correspond a T
MatriceActivite(1,:) = T;
% Les activités appartenant au chemin critique doivent être lancé a leur
% valeur dans T
MatriceActivite(2,cheminCritique) = T(cheminCritique);

