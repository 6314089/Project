function play_a (Afs, Fs, T)
    nAfs = length(Afs);

    N = 44100 * T;
    y = zeros(1, N);
    
    for k = 1:nAfs
        y(floor(k*((N/2)/nAfs))) = Afs(k);
    end
    for k = ceil(N/2):N
        y(k) = conj(y(mod(N-k+1,N)+1));
    end
    
    x = ifft(y);
    sound(x, Fs);