function [valeurTensionCritique,T] = getTensionsCritiques(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)

% Ne depend pas du départ

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