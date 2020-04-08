%% Run the model for a certain period 
% We will run the model for a period of 10 minutes (600 Seconds)
% The time resolution of 10 seconds gives us 60 update iterations 

% Declare the NodalTempHistoryMatrix 
NodalTempHistory = zeros(9,60);

% Initialize Nodal histroy with start temperatures
NodalTempHistory(:,1) = T0;

%% Run Model 

% Run model to populate NodalTempHistory matrix
for i =2:size(NodalTempHistory,2)
   NodalTempHistory(:,i) = TempUpdate(NodalTempHistory(:,i-1),C,K);
end

%% Draw Plots 
hold on 
for i = 1: size(NodalTempHistory,1)
    subplot(3,3,i)
    plot(NodalTempHistory(i,:));
end
hold off

