function [marques] =  Marquage(flot, source, puit, sommets, capacite, successeurs, pointeurs)

marques = zeros(1, size(sommets,2));
marques(source)=1;

condition = true;
while(condition)
	anciensMarques = marques;
	for (s = sommets)
        indS = getIndSommet(s);
		if (marques(indS) ~= 0)
			for (t = getSommetsSuivants(pointeurs, successeurs, sommets, s))
				indSommet = getIndSommet(sommets, t);
				indArc = getIndArc(s, t, pointeurs, successeurs, sommets);
				if (marques(indSommet) == 0 & flot(indArc) < capacite(indArc))
					marques(indSommet) = s;
				end
				
				indArc = getIndArc(t, s, pointeurs, successeurs);
				if (marques(indSommet) == 0 & flot(indArc) ~= 0)
					marques(indSommets) = -s;
				end
			end
		end
	end
	condition = anciensMarques ~= marques;
end
