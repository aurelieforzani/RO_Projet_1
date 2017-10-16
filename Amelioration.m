function [ flots ] = Amelioration( puits, source , sommets, marques, pointeurs, successeurs)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

t = puits;
while( t ~= source)
    if (marque(getIndSommet(t)) > 0)
        s = marques(getIndSommet(t));
        indArc = getIndArc(s, t, pointeurs, successeurs, sommets);
        flots(indArc) = flots(indArc) + 1;
    else if (marque(getIndSommet(t)) < 0)
            s = marques(getIndSommet(t));
        indArc = getIndArc(t, -s, pointeurs, successeurs, sommets);
        flots(indArc) = flots(indArc) - 1;
        end
        t = s;
    end
end

return
end

