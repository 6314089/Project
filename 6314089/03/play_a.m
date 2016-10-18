function play_a (Afs, T)

    Fs = 44100;

    nAfs = length(Afs);

    N = Fs * T;
  
    t = 0:(1/Fs):T;
    y = zeros(1, length(t));
    for k = 1:nAfs
        Af = Afs(k);
        y = y + abs(Af)*sin((2*pi*(27.5*k)*t) + angle(Af));
    end
    
    sound(y, Fs);
    