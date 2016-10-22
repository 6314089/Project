function ret = istft(spectrogram, window, step)
    frameLen = length(window);

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
        counter(s:e) = counter(s:e) + window;
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