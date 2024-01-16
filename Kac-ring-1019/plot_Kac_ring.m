function plot_Kac_ring( Ring, Marker, Nsite)
%% Plot the Kac ring
%  Input: Ring   --- The Kac's ring
%         Marker --- The markers
%         Nsite  --- number of sites

%% Step 1: Divide the black and white balls
B = [];
W = [];
for i = 1:Nsite
  if(Ring(i) == 1)
    B = [B, i];
  else
    W = [W, i];
  end
end

M = [];
for i = 1:Nsite
  if(Marker(i) == 1)
    M = [M, i];
  end
end

%% Step 2: plot the sites of Kac's ring
r     = sqrt(Nsite);
theta = 0:0.001*pi:2*pi;
x     = r*cos(theta);
y     = r*sin(theta);

figure 
hold on
axis off
plot(x, y, 'k-', 'LineWidth', 1)

%% Step 3: plot the balls
theta = (2*pi)/Nsite;
sc    = 480/sqrt(Nsite);
scatter(r*cos(B*theta), r*sin(B*theta), sc, ...
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k')
scatter(r*cos(W*theta), r*sin(W*theta), sc, ...
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'w')

%% Step 4: plot the markers
sc    = 160/sqrt(Nsite);
scatter(0.9*r*cos((M+0.5)*theta), 0.9*r*sin((M+0.5)*theta), sc, 'r', 'd', 'filled')

end

