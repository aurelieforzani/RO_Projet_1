function[res] = getCheminsDepartArrivee(Depart,Arrivee,Pointeurs,Successeurs)
% retourne la liste de tous les chemins (recursif)
% 
%% EN ENTREE
% Arrivee : nom du Sommet d'Arrivé
% Pointeurs : Liste du nombre d'arcs associé par Sommet
% Successeurs : Liste des successeurs
%% EN SORTIE
%  chemins : liste des chemins
%% DEBUT DU PROGRAMME

chemins = [Depart];
n = 1; % n est la taille courante de chemins
% Tant qu'il existe un élément de la dernière colonne de chemin différent
% de Arrivee, on continue
while (any(chemins(:,n) ~= Arrivee))
    % Parcourir toutes les lignes de notre matrice courante chemins
    for (i = 1:size(chemins,1))
        % Si le chemin atteint Arrivee, ajouter Arrivee dans une nouvelle colonne
        if ((chemins(i,n)) == Arrivee)
            chemins(i,n+1) = Arrivee;
        % Sinon
        else
            
            % Obtenir la liste des sommets suivants au dernier sommet de la ligne
            SommetsSuivants = getSommetsSuivants(Pointeurs,Successeurs,chemins(i,n)); %Liste des Sommets à ajouter
            SommetsUtilises = []; % Liste des Sommets suivants non déjà présent dans la ligne.
            % Parcourir les sommets de SommetsSuivants
            for j = 1:size(SommetsSuivants,2)
                % Si le sommet n'est pas déjà présent dans la ligne,
                % ajouter ce sommet à SommetsUtilises
                if not(any(chemins(i,:) == SommetsSuivants(j)))
                   SommetsUtilises = [SommetsUtilises SommetsSuivants(j)];
                end
            end
            
            % Si la liste est vide (ie si il ne s'agissait pas d'un chemin
            % aboutissant à l'arrivee)
            if (size(SommetsUtilises,2) == 0)
                % Mettre à Arrivee toute la ligne ainsi qu'un élément
                % supplémentaire
                chemins(i,:) = Arrivee;
                chemins(i,n+1) = Arrivee;
            else
                % Le premier sommet suivant est ajouté sur le chemin de la
                % ligne courante
                chemins(i,n+1) = SommetsUtilises(1);
                m = size(SommetsUtilises,2);
                % Pour les sommets suivants, si ils existent, on
                % copie la ligne du chemin courrant, et on l'ajoute en fin
                % de chemins avec le nouveau sommet
                if (m > 1)
                    for k = 2:m
                        ligneChemin = chemins(i,:);
                        ligneChemin(n+1) = SommetsUtilises(k);
                        chemins = [chemins ; ligneChemin];
                    end                
                end            
            end       
        end  
    end
    n = n+1;
end

% Supprimer les lignes de chemins innexistant
CheminVide = ones(1,n).*Arrivee; 
res =[];
for i = 1:size(chemins,1)
    if (any((chemins(i,:) ~= CheminVide) == 1 ))
        res = [res ; chemins(i,:)];
    end
end
return;
end
            
            
            
            
            
            

