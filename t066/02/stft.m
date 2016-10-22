function [ret, f, t] = stft(signal, window, step, fs)
    len = length(window);

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
        ret(:, i) = fft(signal(s:e) .* window, len);
        s = s + step;
        e = e + step;
    end
    return
end