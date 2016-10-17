function As = A_frequencies(filename)
    [input, Fs] = audioread(filename);
    
    m = length(input); %window length
    n = 2^nextpow2(m);
    Y = fft(input, n);
    
    [pks, locs] = findpeaks(abs(Y), 'MinPeakProminence', 2500);
    fs = (locs-1)*(Fs/n);
    nfs = ceil(length(fs)/2);
    
    Asf = get_A;
    
    As = zeros(1, length(Asf));
    for Af = Asf
        for k = 1:nfs
            f= fs(k)
        end
    end