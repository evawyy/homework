clear

%% main program
% Input parameters
fname = './data';
Data = data_processing( fname );
N    = size(Data, 1);
K    = 7;

%% Step 1: Visual the data
figure
hold on
box on
scatter3(Data(:, 1), Data(:, 2), Data(:, 3), 60, 'filled')
view(15, 31)

xlabel('$$x$$', 'fontsize', 16, 'interpreter', 'latex')
ylabel('$$y$$', 'fontsize', 16, 'interpreter', 'latex')
zlabel('$$z$$', 'fontsize', 16, 'interpreter', 'latex')

%% Step 2: k-means algorithm
[cluster, Centroid, radius] = simple_kmeans( Data, K );

%% Step 3: Visualize the data
figure
hold on
box on

%% plot
color = colormap('hsv');
for i = 1:N
  j = mod(107*cluster(i), 256);
  cc = color(j, :);

  scatter3(Data(i, 1), Data(i, 2), Data(i, 3), 100, 'MarkerFaceColor', cc)
end
view(15, 31)

scatter3(Centroid(:, 1), Centroid(:, 2), Centroid(:, 3), 40, 'k', 'filled')

for i = 1:K 
  j = mod(107*i, 256);
  cc = color(j, :);

  [X, Y, Z] = sphere;
  X2 = X*radius(i, 1);
  Y2 = Y*radius(i, 2);
  Z2 = Z*radius(i, 3);

  surf(X2 + Centroid(i, 1), Y2 + Centroid(i, 2), Z2 + Centroid(i, 3), ...
      'LineStyle', 'none', 'FaceAlpha', 0.3, 'FaceColor', cc)
end

