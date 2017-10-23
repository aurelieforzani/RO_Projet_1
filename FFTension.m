%% Algorithme de Ford-Fulkerson pour les tensions maximales

%% Entrées
% Depart : le sommet de départ dans la liste des Sommets
% Arrivee: le sommet d'arrivée dans la liste des Sommets
% Successeur : Le tableaux des successeurs des sommets (vecteur ligne)
% Capacite : Le tableau des capacitées des arcs (vecteur ligne)
% Pointeurs : la liste des pointeurs d'arcs (vecteur ligne)
% Sommets : le tableau des sommets du graphe (vecteur ligne)

%% Sorties
% ValeurTensionMaximale : La valeur de la tension maximale
% CheminTensionMaximale : La chemin de tension maximale

%% Corps de la fonction
function [ValeurTensionMaximale, CheminTensionMaximale] = FFTension(Depart, Arrivee, Successeur, Capacite, Pointeurs, Sommets)

% Le nombre de sommets du graphe
nombreSommets = size(Pointeurs,2);

% Le nombre d'arcs du graphe
nombreArcs = sum(Pointeurs);

% Vecteur de la tension courante theta
theta = zeros(1,nombreArcs);

% MARQUE est le vecteur qui contient les sommets marqués
MARQUE = false(1,nombreSommets);

% On marque le sommet d'arrivée
MARQUE(Arrivee) = true;

% On récupère les sommets non marqués
NONMARQUES = Sommets(~MARQUE);

% PLUSCOURTCHEMIN est le vecteur qui contient les sommets tel que le chemin
% a une tension maximale.
PLUSCOURTCHEMIN = zeros(1,nombreSommets);
% On part forcément du depart
PLUSCOURTCHEMIN(1) = Depart;

% Tant que le départ n'est pas marqué
while ismember(Depart,NONMARQUES)
    
    % CANDIDATS : Vecteur qui contient les possibles candidats à marquer
    CANDIDATS = false(1,nombreSommets);
    
    %% 1 - Mise à jour de la tension courante
    
    % Multiplicateur de cocycle pour la mise à jour de theta
    beta = inf;
    
    % Vecteur cocyles initialement nul
    vcocycle = zeros(1,nombreArcs); 
    
    % Pour chaque sommet non marqué
    for l=1:size(NONMARQUES,2)
        i = NONMARQUES(l);
        
        % Si il a des successeurs
        if Pointeurs(i) ~= 0
            prsuc = sum(Pointeurs(1:i-1)) + 1;
            
            % Pour tous les arcs qui partent de ce sommet
            for k = prsuc:prsuc+Pointeurs(i)-1
                
                % On récupère le sommet successeur
                j = Successeur(k);
                
                % Si il est marqué alors 
                if MARQUE(j)
                    % j est un sommet marqué (et i est nonmarqué donc (i,j)
                    % appartient au cocycle donc i est candidat à être
                    % marqué
                    CANDIDATS(i) = true;
                    
                    % On met à jour le multiplicateur de cocycle
                    % (beta > 0)
                    beta = min(beta,Capacite(k)-theta(k));
                    
                    % On positionne la valeur dans le cocycle
                    vcocycle(k) = 1;
                end
            end
        end
    end
    
    % On met la tension courante à jour
    theta = theta + beta*vcocycle;
 
    %% 2 - Marquage des sommets
    
    % listeCandidatsMarquage : la liste des candidats au marquage 
    listeCandidatsMarquage = Sommets(CANDIDATS);
    
    % Pour chaque candidat au marquage non marqué
    for l=1:size(listeCandidatsMarquage,2)
        i = listeCandidatsMarquage(l);
        
        % Si il a des successeurs
        if Pointeurs(i) ~= 0
            prsuc = sum(Pointeurs(1:i-1)) + 1;
            
            % Pour chaque arc qui part de ce sommet candidat
            for k = prsuc:prsuc+Pointeurs(i)-1
                
                % On récupère son successeur
                j = Successeur(k);
                
                % Si il est marqué et que la valeur de tension sur cet arc
                % est égal à sa valeur
                if MARQUE(j) && theta(k) == Capacite(k)
                    
                    % On marque le candidat
                    MARQUE(i) = true;
                    % On l'enlève de la liste des non marqués
                    NONMARQUES = setdiff(NONMARQUES,i);
                end
            end
        end
    end
end

%% 3 - Extraction de la valeur de tension maximale et du chemin de tension maximale

% On part du sommet de depart
sommet = Depart;

% prsuc : prochain successeur
prsuc = 1;

% nsom : position du sommet suivant dans le tableau PLUSCOURTCHEMIN
nsom = 1;

% Tant que l'arrivée n'est pas atteinte
while sommet ~= Arrivee
    
    % Pour chaque arc partant du sommet courant
    for k = prsuc:prsuc+Pointeurs(i)-1
        j = Successeur(k);
        
        % Si la tension courante est égale à la valeur de la capacité
        if theta(k) == Capacite(k)
            % On ajoute ce sommet à la liste ...
            nsom = nsom + 1;
            PLUSCOURTCHEMIN(nsom) = j;
            break;
        end
    end
    % ... et on avance jusqu'à ce sommet
    sommet=j;
    
    % On récupère le nouveau premier successeur
    prsuc = sum(Pointeurs(1:sommet-1)) + 1;
    
    % On affecte les valeurs des résultats
end

CheminTensionMaximale = PLUSCOURTCHEMIN(1:nsom);

ValeurTensionMaximale = 0;

for i=1:size(CheminTensionMaximale, 2)-1
    indArc = getIndArc(CheminTensionMaximale(i), CheminTensionMaximale(i+1), Pointeurs, Successeur);
    
    ValeurTensionMaximale = ValeurTensionMaximale + Capacite(indArc);
end

return

end