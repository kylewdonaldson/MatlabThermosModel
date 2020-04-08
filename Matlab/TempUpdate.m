%% Function to update the temperature vector 
function Tnew = TempUpdate (Tcurrent, C, K)
    
    Tnew = (C * Tcurrent) + K;

end 