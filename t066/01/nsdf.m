%**********************************************
% Returns NSDF of input signal.
% Pre:
%       signal = Windowed monophobic signal
%**********************************************
function ret = nsdf(signal, len)
    ret = [];
    % For safety reason. Not sure if this is necessary
    MIN_WINDOW_LEN = 16;     % Random value
    MAX_WINDOW_LEN = 20000;  % Another random value
    % Use signal length as default window length
    if (~exist('len', 'var'))
        len = length(signal);
    end
    
    % Return if the window's length is invalid
    if (len < MIN_WINDOW_LEN || MAX_WINDOW_LEN < len)
        return;
    end
    % Set the window size
    W = len;
    % Maximum delay is half of the window size
    w = W / 2;
    
    % Check dimension
    if (size(signal, 2) > 1)
        if (size(signal, 1) > 2)
            % Signal isn't monophobic
            return;
        end
        % Column vector to row vector
        signal = signal';
    end
    
    % Expand signal and get ACF part
    paddingLength = 2 ^ nextpow2(2 * (W + w) - 1);
    ffted = fft(signal, paddingLength);
    acf = ifft(ffted .* conj(ffted));
    
    ret = acf;  % *** TEMP ***
    
    %-----
    % Well ... maybe the process till here can be replaced by xcorr()
    %-----
    
    % Get summation part
    
    return;
end