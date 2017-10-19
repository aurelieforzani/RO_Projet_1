function [ flots ] = Amelioration( puits, source , sommets, marques, pointeurs, successeurs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

t = puits;
%% Trouver la quantité maximale à ajouter au flot
minFlot = INF;
while( t ~= source)
    s = marques(t);
    if (marque(t) > 0)
        indArc = getIndArc(s, t, pointeurs, successeurs, sommets);
    elseif (marque(t) < 0)
        indArc = getIndArc(t, -s, pointeurs, successeurs, sommets);
    end
    minFlot = min(minFlot, abs(flots(indArc));
    t = abs(s);
end

while( t ~= source)
    if (marque(Sommets(t)) > 0)
    %if (marque(getIndSommet(t)) > 0)
        s = marques(t);
        indArc = getIndArc(s, t, pointeurs, successeurs, sommets);
        flots(indArc) = flots(indArc) + minFlot;
    else if (marque(t) < 0)
            s = marques(t);
            indArc = getIndArc(t, -s, pointeurs, successeurs, sommets);
            flots(indArc) = flots(indArc) - minFlot;
        end
        t = s;
    end
end

return
end

