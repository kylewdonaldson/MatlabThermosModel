%% Get the closest entry out of the colormap for the current temp 
function color = getcolor(cmap,temp)
    % scale the temperature to a value between 0 and 100 for the range 700
    % to 800

    for i=1:size(cmap,1)
       if(i>=(temp-740))
           color = cmap(i,:);
           break;
       end
    end
end