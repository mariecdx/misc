clear all

% Lire le fichiers OBJ
OBJ=read_wobj_modified('I:\Chercheurs\Soulez_Gilles\Projets\AAA_2D3D\Marie\Elastic1_CT\1.Patient\1.Series\Meshes\thrombus_modified.obj');

% On obtient OBJ.vertices qui est un tableau à 3 colonnes avec les coordonnées de sommets

% Création de la liste contenant les coordonnées de sommets (vertex)
list_vertex = OBJ.vertices;

% Renseignements sur la taille de la matrice des sommets
size_list_vertex = size(list_vertex);

size_line_vertex = size_list_vertex (1,1);
size_column_vertex = size_list_vertex (1,2);

% Création de la liste contenant les faces
list_faces = OBJ.objects(2).data.vertices;

% list_edges = [list_faces(1,1) list_faces(1,2); list_faces(1,2) list_faces(1,3); list_faces(1,1) list_faces(1,3)];

% % Renseignements sur la taille de la matrice des faces
size_list_faces = size(list_faces);

size_line_faces = size_list_faces (1,1);
size_column_faces = size_list_faces (1,2);

% % Création d'une liste vide
list_edges_new = [];

% % Boucle parcourant toutes les lignes
for i = 1:size_line_faces
    if list_faces(i,1) < list_faces(i,2) %test pour mettre le + petit en 1er
        current_edge = [list_faces(i,1) list_faces(i,2)];
        list_edges_new = [list_edges_new; current_edge]; % ajout à la liste
    else
        current_edge = [list_faces(i,2) list_faces(i,1)];
        list_edges_new = [list_edges_new; current_edge]; % ajout à la liste
    end
    
    
    if list_faces(i,2) < list_faces(i,3) %test pour mettre le + petit en 1er
        current_edge = [list_faces(i,2) list_faces(i,3)];
        list_edges_new = [list_edges_new; current_edge]; % ajout à la liste
    else
        current_edge = [list_faces(i,3) list_faces(i,2)];
        list_edges_new = [list_edges_new; current_edge]; % ajout à la liste
    end
    
    
    if list_faces(i,1) < list_faces(i,3) %test pour mettre le + petit en 1er
        current_edge = [list_faces(i,1) list_faces(i,3)];
        list_edges_new = [list_edges_new; current_edge]; % ajout à la liste
    else
        current_edge = [list_faces(i,3) list_faces(i,1)];
        list_edges_new = [list_edges_new; current_edge]; % ajout à la liste
    end
    
end


% % Renseignements sur la taille de la matrice des edges
size_list_edges = size(list_edges_new);

size_line_edges = size_list_faces (1,1);
size_column_edges = size_list_faces (1,2);


% % Regarde si chaque arrête appartient à plus de 2 triangles 

for i=1:size_line_edges
    current_matrice = [list_edges_new(i,1) list_edges_new(i,2)];
    count = 0;
    
    for j=1:size_line_edges
       if j ~= i
           if current_matrice == [list_edges_new(j,1) list_edges_new(j,2)]
               count = count +1;               
           end
       end
    end
    
    if count > 1
        message = sprintf ('L arrête (%d;%d) appartient à plus de 2 triangles', list_edges_new(i,1),list_edges_new(i,2))
    end
end

% Création d'une liste vide qui va contenir le ratio des différentes arrêtes
list_edges_ratio = [];

for i=1:size_line_vertex
    length_edge1 = abs(list_vertex(i,1) - list_vertex(i,2)); % Calcul de la longueur de la 1ère arrête
    length_edge2 = abs(list_vertex(i,2) - list_vertex(i,3)); % Calcul de la longueur de la 2ème arrête
    length_edge3 = abs(list_vertex(i,1) - list_vertex(i,3)); % Calcul de la longueur de la 3ème arrête
    
    length_edges = [length_edge1 length_edge2 length_edge3]; % Matrice qui contient la longueur des 3 arrêtes
    
    edge_max = max(length_edges); % Calcul de l'arrête la + grande
    edge_min = min (length_edges); % Calcul de l'arrête la + petite
    
    current_edge_ratio = [edge_max/edge_min]; % Calcul du ratio de l'arrête la + grde sur l'arrête la + petite
    
    if current_edge_ratio > 2
       message = sprintf ('pas bon pour le triangle %d-%d-%d', list_faces(i,1),list_faces(i,2),list_faces(i,3));
    end
    
    list_edges_ratio = [list_edges_ratio ; current_edge_ratio];
end

%Renseignements sur les arrêtes: longueur minimale, maximale et moyenne
min_edges_ratio = min(list_edges_ratio);
max_edges_ratio = max(list_edges_ratio);
moy_edges_ratio = mean (list_edges_ratio(:));

save ('edgesRatio.mat','list_edges_ratio')

% Création d'histogramme



% % Liste des edges sans les redondances
% liste_edges_sans_redondance = [0 0];
% 
% for i=1:size_line_edges
%     current_matrice = [list_edges_new(i,1) list_edges_new(i,2)];
%     redondance = ismember (liste_edges_sans_redondance, current_matrice, 'rows');
%     
%     if redondance == 0
%         liste_edges_sans_redondance = [liste_edges_sans_redondance; current_matrice];
%     end
% end
