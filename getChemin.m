function[chemin] = getChemins(Ligne,Arrivee)
    ind = 1;
    while (Ligne(ind) ~= Arrivee)
        ind = ind + 1;
    end
    chemin = Ligne(1:ind);
    return;
end