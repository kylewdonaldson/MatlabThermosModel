%% Draw Visualisation 
% draw a grid representation of the temperature distribution over time 

%% Draw the model 

% Define base colour (grey) 
cbase = [0.5 0.5 0.5];

% create the plotting area, define limits, set aspect ratio 
clf
figure
hold on 
xlim ([0 40])
ylim ([0 40])
pbaspect([1 1 1])

%% Define the corner points 
mincorner = [4,4];
maxcorner = [16,28];

%% draw the rectangles 
for i = mincorner(1):maxcorner(1) 
   for j = mincorner(2):maxcorner(2)
        rectangle('Position',[j,i,0.5,0.5],'FaceColor',cbase,'EdgeColor','k','LineWidth',1)
   end
end
