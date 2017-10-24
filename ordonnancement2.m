function [valeurTensionCritique, cheminCritique, matriceActivite] = ordonnancement2(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)
%% ORDONNANCEMENT : trouve le chemin permettant de finir les travaux le plus rapidement possible
%% EN ENTREE : 
% Depart : sommet de départ du graphe
% Arrivee : sommet d'arrivee du graphe
% Capacité : capacité (délai entre chaque travaux de chaque arc)
% Pointeurs : Pointeurs : nombre de successeurs de chaque sommets
% Successeur : sommets pointés par des arcs
% Sommets : les sommets du graphe

%% EN SORTIE
% valeurTensionCritique : Tension maximale associée au chemin critique
% (temps pour finir les travaux)
% cheminCritique : chemin permettant de finir les travaux au plus vite
% matrice activité : temps de démarage au plus tot et au plus tard de
% chaque travaux

%% T : Temps de démarrage au plus tot de chaque sommet
T = zeros(1,size(Pointeurs,2));

%% Calcul du temps de démarrage au plus tot pour chaque travaux
for i = 1:size(Pointeurs,2)
    sommetsSuivants = getSommetsSuivants(Pointeurs,Successeur,i);
    % On regarde si le travail rallonge le temps de démarrage de ses successeurs
    for j = sommetsSuivants
        indArc = getIndArc(i, j, Pointeurs, Successeur);
        % Le délai(capacité) entre j et i rallonge le temps de démarrage au plus tot
        if (T(j) - T(i)) <= Capacite(indArc)
            % Nouveau temps au plus tot
            T(j) = Capacite(indArc) + T(i);
        end
    end
end

%% Etablissement du chemin critique
cheminCritique = [Arrivee];
valeurTensionCritique = T(Arrivee)
sommet = Arrivee;
while (sommet ~= Depart)
    sommetsPrecedents = getSommetAvants(Pointeurs',Successeur',sommet);
    ind = 1;
    indArc = getIndArc(sommetsPrecedents(ind), sommet, Pointeurs, Successeur);
    % choix du meilleur arc pour rejoindre sommet
    while ((T(sommet) - Capacite(indArc)) ~= T(sommetsPrecedents(ind)))
        ind = ind+1;
        indArc = getIndArc(sommetsPrecedents(ind), sommet, Pointeurs, Successeur);
    end
    sommet = sommetsPrecedents(ind);
    cheminCritique = [sommet  cheminCritique];
end

matriceActivite = zeros(2,size(Pointeurs,2));
% Le temps minimum pour lancer une activité correspond a T
matriceActivite(1,:) = T;
% Les activités appartenant au chemin critique doivent être lancé a leur
% valeur dans T
matriceActivite(2,cheminCritique) = T(cheminCritique);

