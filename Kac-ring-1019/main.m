%%parameters
numB  = 150;
numW  = 30;
mu    = 0.05;
Nsite = numB +numW;

Ntimes = round(Nsite*0.4);
Delta  = zeros(1, Ntimes+1); %% the difference between of counts of black and white balls

%% Step 1: generate a Kac ring
Ring = generate_Kac_ring_site(numB, numW);

%% Step 2: generate a random marker
Marker = generate_Kac_ring_marker( mu, Nsite);

%% Step 3: plot the Kac's ring
plot_Kac_ring( Ring, Marker, Nsite);
Delta(1) = 2*sum(Ring) - Nsite;

%% open the video stream
fname  = './Kac_ring.avi';
vidObj = VideoWriter( fname );
vidObj.FrameRate = 3;
open(vidObj);

%% Step 4 : run the Kac's ring
for i = 1:Ntimes
  Ring = run_Kac_ring(Ring, Marker, Nsite);
  Delta(i+1) = 2*sum(Ring)- Nsite;

  plot_Kac_ring( Ring, Marker, Nsite);
  set(0, 'defaultfigurecolor', 'w'); %% background white
  
  c_time = ['t = ', num2str((i-1))]; %% title
  title(c_time, 'fontsize', 15, 'Interpreter', 'latex');
  
  currFrame = getframe( gcf );  
  writeVideo(vidObj, currFrame);
  close( gcf );
end
close(vidObj)

%% Step 5: plot the Delta
figure
t = 0:1:Ntimes;
plot(t, Delta)

