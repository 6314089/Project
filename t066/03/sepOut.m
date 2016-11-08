%**************************************************************************
% Create ".ext" audio file from given params. (".wav" by default.)
% Output filenames are like
%       "name(num).ext"
%
% Pre:
%       H, U        = (see reconstruct.m)
%       fs          = Reconstructed signal's frequency.
%       phase, step, length = (see reconstruct.m)
%       name        = The location at where the files will be created.
%       ranks       = A cell array of n * 1 vectors. Different files are created
%                     from different vectors. (see reconstruct.m for more info.)
%       winHandler  = (see reconstruct.m). @hann by default. Can't be treated
%                     as an optional param with designated file type.
%       ext         = Output file type. ".wav" by default.
%**************************************************************************
function sepOut(H, U, fs, phase, step, length, name, ranks, winHandler, ext)
    % Set defaults
    if (~exist('winHandler', 'var'))
        winHandler = @hann;
    end
    if (~exist('ext', 'var'))
        ext = 'wav';
    end
    
    % Reconstruct and write for each
    for col = 1:size(ranks, 2)
        reconstructed = reconstruct(H, U, phase, step, length, winHandler, ranks{col});
        audiowrite(strcat(name, '(', num2str(col - 1), ').', ext), reconstructed, fs);
    end
end