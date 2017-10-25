
function [valeurTensionCritique] = getTensionsCritiques(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)

CapaciteAux = max(Capacite)-Capacite;
[ValeurTensionMinimale, CheminTensionMinimale] = FFTension(Depart, Arrivee, Successeur, CapaciteAux, Pointeurs, Sommets);

valeurTensionCritique = 0;
for k = 1:size(CheminTensionMinimale,2)-1
   indArc = getIndArc(CheminTensionMinimale(k),CheminTensionMinimale(k+1) , Pointeurs, Successeur);
   valeurTensionCritique = valeurTensionCritique + Capacite(indArc);
end
return
end

