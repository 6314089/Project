%**************************************************************************
% Does "audioread", "stft", "abs(spectrogram)", "angle(spectrogram)" at
% once.
%
% Pre:
%       filename    = Name of an audio file to read.
%       step        = (for stft)
%       len         = (for stft)
%       winHandler  = (for stft. Uses @hann by default.)
% Post:
%       spectrogram = (result from stft)
%       Y           = (result from abs(spectrogram))
%       phase       = (result from angle(spectrogram))
%       f           = (result from stft)
%       t           = (result from stft)
%**************************************************************************
function [spectrogram, Y, phase, f, t] = nmfReady(filename, step, len, winHandler)
    if (~exist('winHandler', 'var'))
        winHandler = @hann;
    end

    [y, fs] = audioread(filename);
    % Convert to mono
    y = (y(:, 1) + y(:, 2))/2;
    
    % STFT
    [spectrogram, f, t] = stft(y, winHandler, step, len, fs);
    % Abs and angle
    Y = abs(spectrogram);
    phase = angle(spectrogram);
end