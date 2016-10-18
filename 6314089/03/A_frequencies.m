function ret = A_frequencies(filename)
    %read file
    [input, Fs] = audioread(filename);
    
    %fft
    m = length(input); %window length
    n = 2^nextpow2(m);
    Y = fft(input, n);
    
    %get peek frequencies and length
    [~, locs] = findpeaks(abs(Y), 'MinPeakProminence', 2500);
    peekfs = (locs-1)*(Fs/n); %turn locs into "0 start" and into frequencies
    npeekfs = ceil(length(peekfs)/2);
    
    %get key A frequencies and length
    Afs = get_A;
    nAfs = length(Afs);
       
    %fill return value with 0
    ret = zeros(1, length(Afs));

    %10cents
    threshold = nthroot(2, 12*10);    

    
    for i = 1:nAfs
        Af = Afs(i);
        for j = 1:npeekfs
            f= peekfs(j);
            if (Af >= f && Af / f <= threshold) ||...
                (Af < f && f / Af <= threshold) %+-10cents
               ret(i) = Y(locs(j)) / n; %
            end
        end
    end
    