function [marques] =  Marquage(flot, source, puit, sommets, capacite, successeurs, pointeurs)

%% EN ENTREE
%flot : la liste dse flots après la phase de saturation
% source : le sommet de départ
% puit : le sommet d'arrivé
% sommets : la liste des sommets du graphe
% capacite : la liste des capacité (maximale) sur chaque arc
% successeurs : la liste ds succeseurs de chaque arc
% pointeurs : la liste du nombre de successeurs de chaque arc

%% EN SORTIE
% marques : la liste dse marquage de chaque sommets

%% Initialisation des marques, seul le sommet de départ est marqué
marques = zeros(1, size(sommets,1));
marques(source)=1;

%% Marquage ds autres sommest
condition = true;
nouveauSommetMarque = true;
while(condition)
    while(nouveauSommetMarque)
        nouveauSommetMarque = false;
        % Enregistrée la marque courante (pour pouvoir la comparer à la fin
        % Utile pour savoir si le marquage a été modifié
        anciensMarques = marques;
        % pour tous les sommets ...
        for (s = sommets')
            % ... marqués
            if (marques(s) ~= 0)
                % Pour tous les succeseurs du sommet marqué courant
                for (t = getSommetsSuivants(pointeurs, successeurs, s))
                    % récupérer l'indice de la'arc s->t
                    indArc = getIndArc(s, t, pointeurs, successeurs);
                    
                    % Marquer le sommet t si l'arc n'est pas saturé et si le
                    % sommet t n'est pas déjà marqué
                    if (marques(t) == 0 & flot(indArc) < capacite(indArc))
                        marques(t) = s;
                        nouveauSommetMarque = true;
                    end
                    
                end
                for (t = getSommetsAvant(pointeurs, successeurs,s))
                    
                    % Marquer le sommet t si l'arc a un flot non nul et si le
                    % sommet t n'est pas déjà marqué
                    if (marques(t) == 0 & flot(indArc) ~= 0)
                        marques(t) = -s;
                        nouveauSommetMarque = true;
                    end
                end
            end
        end
    end
    
    % Vérifier si on à modifier le marquage, si oui continuer sinon arrêter
	condition = anciensMarques ~= marques;
end
