function [CheminCritique, TempsMinMax] = ordonnancement(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)

% Liste associant le sommet critique précédent pour chaque sommets
Marquage = ones(1:size(Pointeurs)).*Arrivee;

% Marquer les arcs critiques
for i=Sommets
    sommetsPrecedent = getSommetAvants(Pointeurs,Succeseur,i);
    max = 0;
    for j=sommetsPrecedent
        [ValeurTensionMaximale, CheminTensionMaximale] = FFTension(Depart, j, Successeur, Capacite, Pointeurs, Sommets);
        ind = getIndArc(j,i,Pointeurs,Successeurs);
        if (ValeurTensionMaximale + Capacite(ind) > max)
            max = ValeurTensionMaximale + Capacite(ind);
            Marquage(i) = j;
        end
    end
end


%Déterminer le chemin critique
ind = Arrivee;
CheminCritique = [Arrivee];
while (Marquage(ind) ~= Depart)
    CheminCritique = [Marquage(ind) CheminCritique];
end
cheminCritique = [Depart CheminCritique];