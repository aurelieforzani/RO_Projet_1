function [ flots ] = Amelioration( puits, source , sommets, marques, pointeurs, successeurs, flots)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

t = puits;
%% Trouver la quantité maximale à ajouter au flot
minFlot = inf;
while( t ~= source)
    s = marques(t);
    if (s > 0)
        
        indArc = getIndArc(s, t, pointeurs, successeurs);
    else
        
        indArc = getIndArc(t, -s, pointeurs, successeurs);
    end
    if (s ~= 0)
        minFlot = min(minFlot, abs(flots(indArc)));
    end
    t = abs(s);
end

t = puits;
while( t ~= source)
    if (marques(sommets(t)) > 0)
        %if (marque(getIndSommet(t)) > 0)
        s = marques(t);
        indArc = getIndArc(s, t, pointeurs, successeurs);
        flots(indArc) = flots(indArc) + minFlot;
    elseif (marques(t) < 0)
        s = marques(t);
        indArc = getIndArc(t, -s, pointeurs, successeurs);
        flots(indArc) = flots(indArc) - minFlot;
    end
    t = abs(s);
end

return
end

