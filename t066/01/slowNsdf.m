function ret = slowNsdf(signal, len)
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
    
    % Check dimension
    if (size(signal, 2) > 1)
        if (size(signal, 1) > 2)
            % Signal isn't monophobic
            return;
        end
        % Column vector to row vector
        signal = signal';
    end
    
    %calc SDF
    ret = zeros(W / 2, 1);
    %
    r = zeros(W / 2 + 1, 1);
    m = zeros(W / 2 + 1, 1);
    %
    for tau = 0:W / 2 - 1
        %
        %
        for j = 1:W - tau
            r(tau + 1) = r(tau + 1) + signal(j) * signal(j + tau);
            m(tau + 1) = m(tau + 1) + signal(j) ^ 2 + signal(j + tau) ^ 2;
        end
        ret(tau + 1) = r(tau + 1) * 2 / m(tau + 1);
    end
    
    %ret = [r*2 m];
    return;
end