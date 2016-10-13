function ar = hanned(y, width, step)
    ar = [];
    len = size(y);
    if len(2) == 2
       return
    end
    len = len(1);       %to get mono size. bad coding
    s = 1;
    e = width;
    over = width > len;
    arNum = floor((len - width) / step) + 1; %to get loop amount. bad coding
    ar = zeros(width, arNum);
    counter = 1;
    while over == false
        ar(:, counter) = ar(:, counter) + abs(fft(y(s:e, 1) .* hann(width)));
        counter = counter + 1;
        s = s + step;
        e = e + step;
        over = e > len; %some of data may be discarded unread
    end
    return