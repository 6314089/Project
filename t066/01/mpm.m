%*************************************************************************
% Returns the highest possible f0 of input signal if successful / 0 if failed
% Pre:
%       signal = (Windowed) Monophonic signal in a column vector
%       fs     = signal's frequency [Hz]
%       len    = Window's length. Must be an even number.
%                signal's length will be used when no parameter is given.
%       k      = Minimum value of a correlation value
%*************************************************************************
function hz = mpm(signal, fs, len, k)
    hz = -1;
    % For safety reason. Not sure if this is necessary
    MIN_WINDOW_LEN = 16;     % Random value
    MAX_WINDOW_LEN = 20000;  % Another random value
    % Use signal length as default window length
    if (~exist('len', 'var'))
        len = length(signal);
    end
    % Use 0.8 as default k value
    if (~exist('k', 'var'))
        k = 0.8;
    end
    % Return if the window's length is invalid
    if (len < MIN_WINDOW_LEN || MAX_WINDOW_LEN < len || mod(len, 2) == 1)
        return;
    end
    % Check dimension
    if (size(signal, 2) > 1)
        if (size(signal, 1) > 2)
            % Signal isn't monophonic
            return;
        end
        % Column vector to row vector
        signal = signal';
    end
    % Zero-pad or window the signal if needed
    if (length(signal) < len)
        signal = [signal; zeros(len - length(signal), 1)];
    else
        signal = signal(1:len);
    end
    
    % Get NSDF
    nsdfed = nsdf(signal);
    
    hz = 0;
    % Get the information of most likely corresponding to the desired Hz
    [val, index] = getDelay(nsdfed, k); 
    if (val == 0)
        % Not found
        return
    end
    
    delay = index;
    if index ~= length(nsdfed)
        % Parabolic Interpolation
        delay = index + parabol(nsdfed(index - 1), nsdfed(index), nsdfed(index + 1));
    end
    
    hz = fs / delay;
end