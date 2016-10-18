function play_a (Afs, Fs, T)
    nAfs = length(Afs);

    N = 44100 * T;
  
    t = 0:(1/Fs):T;
    y = zeros(1, length(t));
    for k = 1:nAfs
        Af = Afs(k);
        y = y + abs(Af)*sin((2*pi*(27.5*k)*t) + angle(Af)) / 50000;
    end
    
    sound(y, Fs);