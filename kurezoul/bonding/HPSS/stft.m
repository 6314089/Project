%**************************************************************************
% Returns spectrogram and two vectors; the first one stores frequencies and
% the other stores time.
%
% Pre:
%       signal          = mono
%       windowHandler   = A handler to the function which generates a specific 
%                         window by giving disired window length
%       step            = The distance between each adjoining frame's start index.
%       len             = window size
%       fs              = signal's frequency
%**************************************************************************
function [ret, f, t] = stft(signal, windowHandler, step, len, fs)
    % To column vector if not
    if (size(signal, 2) ~= 1)
        signal = signal';
    end

    % Separate signal into frames
    num = floor((length(signal) - len) / step) + 1;
    ret = zeros(len, num);
    
    % Create f and t
    f = (0: fs / len : fs - fs / len)';
    t = linspace(0, length(signal) / fs, num);
    
    % Perform FFT to frames
    s = 1;
    e = len;
    for i = 1:num
        ret(:, i) = fft(signal(s:e) .* windowHandler(len), len);
        s = s + step;
        e = e + step;
    end
    return
end