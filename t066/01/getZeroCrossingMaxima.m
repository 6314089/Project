%*************************************************************************
% Returns a N * 2 vector which contains all the highest maximum between
% every positively sloped zero crossing.
% N is the number of found peaks.
% The first column stores normalized correlation values. The other stores 
% the indices from which each of the corresponding peak has been taken.
%
% Pre:
%       vec = n * 1 vector
%*************************************************************************
function ret = getZeroCrossingMaxima(vec)
    ret = [];
    % Target must be n * 1 vector
    if (size(vec, 2) ~= 1)
        return;
    end
    
    temp = zeros(length(vec), 2);
    chkVal = false; % True when on between positively sloped zero crossing
    prevWasMinus = false; % duh
    cur = [0 0]; % current(maxVal, index)
    index = 0;
    pos = 1;
    for v = vec'
        % Update index
        index = index + 1;
        
        % Pos
        if v > 0
            % A little bit dull code
            if prevWasMinus
                chkVal = true;
                prevWasMinus = false;
            end
            if chkVal
               if v > cur(1)
                   cur = [v index];
               end
            end
        % Neg
        elseif v < 0
            prevWasMinus = true;
            if chkVal
                chkVal = false;
                temp(pos, :) = cur;
                pos = pos + 1;
                cur = [0 0];
            end
        % Zero. Do nothing
        else
        end
    end
    % If the signal ends while on positive slope
    % the final highest maximum so far is accepted
    if (cur(1) > 0)
        temp(pos, :) = cur;
    end
    
    % Discard zeros
    indices = find(temp(:, 1) > 0)';
    ret = zeros(length(indices), 2);
    pos = 0;
    for i = indices
        pos = pos + 1;
        ret(pos, :) = temp(i, :);
    end
    
    return;
end