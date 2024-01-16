function [cluster, Centroid, radius] = simple_kmeans( Data, K )
%% A simple realization of kmeans algorithm
% Input: Data matrix, the specified K
% Output: cluster: a vector that marks the cluster that each particle belongs to

%% variables 
N    = size(Data, 1);
d    = size(Data, 2);
Centroid = zeros(K, d);
radius   = zeros(K, d);

%% Step 1: Randomly choose K points as the inital centroid
index_seed = random_shuffle(K, N);
for i = 1:K
  Centroid(i, :) = Data(index_seed(i), :);
end

%% Step 2: Allocate the initial clustering
cluster = generate_data_clustering(Data, Centroid, K);

%% Step 3: Alternatively update centroids and clustering 
cluster_pre = zeros(1, N);
ncount      = 0;

while(max(abs(cluster_pre - cluster)) ~= 0)
  % record the cluster in previous step
  cluster_pre = cluster;
  
  % recalculate the centroid
  Centroid = calculate_centroid( Data, cluster, K); 

  % reclustering
  cluster = generate_data_clustering(Data, Centroid, K);

  % terminal when exceeding the maximal times of iteration
  ncount = ncount + 1
  if(ncount >= 1000)
    break;
  end
end

%% Step 4: Calculate the radius
for i = 1:N
  for j = 1:d
    k = cluster(i);
    radius(k, j) = max(abs(Data(i, j) - Centroid(k, j)), radius(k, j));
  end
end

end


function index_seed = random_shuffle(K, N)
%% sampling K times from (1,2,...N) without replacement
% Input: K and N
% Output: index_seed: the indices for K smallest values 

% generate N random vector
rand_array = rand(1, N);

% sorting
[A, I] = sort(rand_array);
index_seed = I(1:K);

end

function cluster = generate_data_clustering(Data, Centroid, K)
%% Generate the clustering of data
% Input: Data matrix, Centroid matrix and specified K
% Output: the cluster table of data

%% parameters 
N       = size(Data, 1);
cluster = zeros(N, 1);
D2      = zeros(N, K);

%% Calculate the distances
for i = 1:N
  for j = 1:K
    D2(i, j) = calcuate_square_Euclidean_dist(Data(i, :), Centroid(j, :));
  end
end

%% Find the cluster
for i = 1:N
  [M, ind] = min(D2(i, :));
  cluster(i) = ind(1);
end

end

function dist = calcuate_square_Euclidean_dist(point1, point2)
%% calculate the square of Euclidean distance of two points
%  Input: two points 'points1' and 'points2'
%  Output: the square distance of two points

%% distance
dist = sum((point1 - point2).^2);

end


function Centroid = calculate_centroid( Data, cluster, K)
%% Calculate the centroid of data
% Input:  Data matrix, the cluster table and specified K
% Output: New centroids of points

N        = size(Data, 1);
d        = size(Data, 2);
Centroid = zeros(K, d);
Ncount   = zeros(K, 1);

% record the summation of positions and numbers of particle in each cluster
for i = 1:N
  Centroid(cluster(i), :) = Centroid(cluster(i), :) + Data(i, :);
  Ncount(cluster(i))      = Ncount(cluster(i)) + 1;
end

% Taking averaging and obtaining the new centroid 
for k = 1:K
  Centroid(k, :) = Centroid(k, :)/Ncount(k);
end

end
