%**************************************************************************
% *parabolic interpolation*
%
% Pre:
%
%**************************************************************************
function px = parabol(p1, p2, p3)
    px = (p3 - p1) / (2 * (p1 - 2 * p2 + p3));
    return
end