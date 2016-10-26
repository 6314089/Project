%**************************************************************************
% Reconstructs signal from H and U where those suffice
% "abs(signal'sSpectrogram) ~= H * U".
%
% Pre:
%       H           = (*see above)
%       U           = (same as above)
%       phase       = phase angles of original signal's spectrogram
%       step        = The distance between each adjoining frame's start
%                     index. Must be the same value that was used to
%                     create the spectrogram
%       length      = Window size Must be the same value that was used to
%                     create the spectrogram
%       winHandler  = A handler to the window generating function which
%                     is used to create the spectrogram. 
%                     Uses hanning window (@hann) by default.
%       ranks       = 1 * X vector where X is equal to or less than the
%                     number of rows in H. Used to pick components of H and U
%                     to reconstruct signal from some specified spectrums.
%                     Uses "1:size(H, 2)" by default.
%**************************************************************************
function y = reconstruct(H, U, phase, step, length, winHandler, ranks)
    % Set defaults
    if (~exist('winHandler', 'var'))
        winHandler = @hann;
    end
    if (~exist('ranks', 'var'))
        ranks = 1:size(H, 2);
    end
    
    % Ignore unused columns
    for i = 1:size(H, 2)
        if isempty(find(ranks == i, 1))
            H(:, i) = zeros(size(H, 1), 1);
        end
    end
    
    % Reconstruct
    istfted = istft(H * U .* exp(1j * phase), winHandler, step, length);
    y = abs(istfted) .* cos(angle(istfted));
end