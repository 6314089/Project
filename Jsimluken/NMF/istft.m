%**************************************************************************
% Reconstructs signal from spectrogram
%
% Pre:
%       spectrogram     = spectrogram (duh)
%       windowHandler   = A handler to the window generating function which
%                         is used to create the spectrogram
%       step            = The distance between each adjoining frame's start
%                         index. Must be the same value that was used to
%                         create the spectrogram
%       frameLen        = window size Must be the same value that was used to
%                         create the spectrogram
%**************************************************************************
function ret = istft(spectrogram, windowHandler, step, frameLen)
    % Prepare for reconstructing
    num = size(spectrogram, 2);
    signalLen = (num - 1) * step + frameLen;
    ret = zeros(signalLen, 1);
    counter = zeros(signalLen, 1);
    
    % IFFT with counting overlapping
    s = 1;
    e = frameLen;
    for i = 1:num
        ret(s:e) = ret(s:e) + ifft(spectrogram(:, i));
        counter(s:e) = counter(s:e) + windowHandler(frameLen);
        s = s + step;
        e = e + step;
    end
    
    % Modify overlapped part
    for i = 1:length(ret)
        % Avoid zero division
        if counter(i) > 1e-7
            ret(i) = ret(i) / counter(i);
        end
    end
    
    return
end