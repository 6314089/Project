function play_a (X, T)

    Fs = 44100;

    [~, n] = size(X);

    t = 0:(1/Fs):T;
    y = zeros(1, length(t));
    for k = 1:n
        y = y + X(1, k)*sin((2*pi*(27.5*k)*t) + X(2, k));
    end
    
    sound(y, Fs);
    
    pause(T+0.2)
    
    soundsc(y, Fs);