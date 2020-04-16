%% Draw Visualisation 
% draw a grid representation of the temperature distribution over time 

%% Draw the model 

% Define base colour (grey) 
cbase = [0.5 0.5 0.5];
% Define air colour 
cair = [0 1 1];
% Define water color
cwater = [0 0 1];

% create the plotting area, define limits, set aspect ratio 

figure
hold on 
xlim ([0 12])
ylim ([0 10])
pbaspect([1 1 1])

%% Define the corner points 
% for the world
mincorner = [0,0];
maxcorner = [5,9];

% for the metal block 
blockmincorner = [1,1];
blockmaxcorner = [4,8];

%% Draw all the lower blocks as water color rectangles 
for i = mincorner(1):maxcorner(1)-1 
   for j = mincorner(2):maxcorner(2)
        rectangle('Position',[j,i,0.8,0.8],'FaceColor',cwater,'EdgeColor','k','LineWidth',1)
   end
end

% Draw the row of air blocks
for i = 0:maxcorner(2)
    rectangle('Position',[i,5,0.8,0.8],'FaceColor',cair,'EdgeColor','k','LineWidth',1)
end

% Draw the metal block 
for i = blockmincorner(1):blockmaxcorner(1) 
   for j = blockmincorner(2):blockmaxcorner(2)
        rectangle('Position',[j,i,0.8,0.8],'FaceColor',cbase,'EdgeColor','k','LineWidth',1)
   end
end

%% we must associate each rectangle of the metal block with a node..
% (this a terrible hack) Define a nodal mapping matrix
nodalmapping = [7 8 8 9 9 8 8 7;
                4 5 5 6 6 5 5 4;
                4 5 5 6 6 5 5 4;
                1 2 2 3 3 2 2 1];
%% Define a color map 
cmap = cool(65);
colormap(cmap)
%% 
% for each time in the temp history matrix 
for t=1:size(NodalTempHistory,2)
    % Update the drawing of the metal block 
    for i = blockmincorner(1):blockmaxcorner(1) 
       for j = blockmincorner(2):blockmaxcorner(2)
            rectangle('Position',[j,i,0.8,0.8],'FaceColor',getcolor(cmap,NodalTempHistory(nodalmapping(i,j),t)),'EdgeColor','k','LineWidth',1)
       end
    end
    title(sprintf('Nodal Temperature Distribution at %0.2f Seconds',(t*10)));
    colorbar();
    pause(0.02);
end


