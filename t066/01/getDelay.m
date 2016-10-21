%**************************************************************************
% Returns the-most-likely-corresponds-to-the-Hz-delay's correlation value
% and its index in vec
%
% Pre:
%       vec = n * 1 NSDF
%       k = Minimum value of a correlation value
% Post:
%       val = A correleation value of the-most-likely-corresponds-to-the-Hz
%             delay (duh)
%       ind = An index of vec where val is stored
%**************************************************************************
function [val, ind] = getDelay(vec, k)
    val = 0;
    ind = 0;
    % Default k's value is 0.8
    if (~exist('k', 'var'))
        k = 0.8;
    end
    
    chkVal = false; % True when on between positively sloped zero crossing
    prevWasMinus = false;
    cur = [0 0]; % current(maxVal, index)
    counter = 0;
    for v = vec'
        % Update index
        counter = counter + 1;
        
        % Pos
        if v > 0
            % A little bit dull code
            if prevWasMinus
                chkVal = true;
                prevWasMinus = false;
            end
            if chkVal
               if v > cur(1)
                   cur = [v counter];
               end
            end
        % Neg
        elseif v < 0
            prevWasMinus = true;
            if chkVal
                chkVal = false;
                if (cur(1) > k)
                    break;
                end
                cur = [0 0];
            end
        % Zero. Do nothing
        else
        end
    end
    % If the signal ends while on positive slope
    % the final highest maximum so far is accepted
    if (cur(1) > k)
        val = cur(1);
        ind = cur(2);
    end
    
    return;
end