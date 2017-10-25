function[res] = getCheminsDepartArrivee(depart,arrivee,pointeurs,successeurs)
% retourne la liste de tous les chemins
% 
%% EN ENTREE
% depart : nom du sommet de départ
% arrivee : nom du Sommet d'Arrivé
% pointeurs : Liste du nombre d'arcs associé par Sommet
% successeurs : Liste des successeurs
%% EN SORTIE
%  chemins : liste des chemins
%% DEBUT DE LA FONCTION

chemins = [depart];
n = 1; % n est la taille courante de chemins
% Tant qu'il existe un élément de la dernière colonne de chemin différent
% de arrivee, on continue
while (any(chemins(:,n) ~= arrivee))
    % Parcourir toutes les lignes de notre matrice courante chemins
    for (i = 1:size(chemins,1))
        % Si le chemin atteint arrivee, ajouter arrivee dans une nouvelle colonne
        if ((chemins(i,n)) == arrivee)
            chemins(i,n+1) = arrivee;
        % Sinon
        else
            
            % Obtenir la liste des sommets suivants au dernier sommet de la ligne
            SommetsSuivants = getSommetsSuivants(pointeurs,successeurs,chemins(i,n)); %Liste des Sommets à ajouter
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
                % Mettre à arrivee toute la ligne ainsi qu'un élément
                % supplémentaire
                chemins(i,:) = arrivee;
                chemins(i,n+1) = arrivee;
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
CheminVide = ones(1,n).*arrivee; 
res =[];
for i = 1:size(chemins,1)
    if (any((chemins(i,:) ~= CheminVide) == 1 ))
        res = [res ; chemins(i,:)];
    end
end
return;
end
            
            
            
            
            
            

