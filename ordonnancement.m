function [CheminCritique, TempsMinMax] = ordonnancement(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)

% Liste associant le sommet critique précédent pour chaque sommets
Marquage = ones(1,size(Pointeurs,2)).*Arrivee;

% Marquer les arcs critiques
for i=Sommets
    sommetsPrecedent = getSommetAvants(Pointeurs,Successeur',i);
    max = 0;
    for j=sommetsPrecedent
        [ValeurTensionMaximale, CheminTensionMaximale] = FFTension(Depart, j, Successeur, Capacite, Pointeurs, Sommets);
        ind = getIndArc(j,i,Pointeurs,Successeur);
        if (ValeurTensionMaximale + Capacite(ind) > max)
            max = ValeurTensionMaximale + Capacite(ind);
            Marquage(i) = j;
        end
    end
end


%Déterminer le chemin critique
ind = Arrivee;
CheminCritique = [Arrivee];
Marquage
Marquage(ind)
while (Marquage(ind) ~= Depart)
    CheminCritique = [Marquage(ind) CheminCritique];
    ind = Marquage(ind);
end
CheminCritique = [Depart CheminCritique];