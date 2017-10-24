function [valeurTensionCritique,T] = getTensionsCritiques(depart, arrivee, successeur, capacite, pointeurs, sommets)

% Ne depend pas du départ

T = zeros(1,size(pointeurs,2));

for i = 1:size(pointeurs,2)
    sommetsSuivants = getSommetsSuivants(pointeurs,successeur,i);
    for j = sommetsSuivants
        indArc = getIndArc(i, j, pointeurs, successeur);
        if (T(j) - T(i)) <= Capacite(indArc)
            T(j) = Capacite(indArc) + T(i);
        end
    end
end

cheminCritique = [arrivee];
valeurTensionCritique = T(arrivee)