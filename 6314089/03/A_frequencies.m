function ret = A_frequencies(filename)
    %read file
    [input, Fs] = audioread(filename);
    
    %fft
    m = length(input); %window length
    n = 2^nextpow2(m);
    Y = fft(input, n);
    
    %get peek frequencies and length
    [pks, locs] = findpeaks(abs(Y), 'MinPeakProminence', 2500);
    fs = (locs-1)*(Fs/n); %turn locs into 0 start and frequencies
    nfs = ceil(length(fs)/2);
    
    %get key A frequencies and length
    Asf = get_A;
    nAsf = length(Asf);
       
    %fill return value with 0
    ret = zeros(1, length(Asf));

    %
    ratio = 0;    

    
    for i = 1:nAsf
        Af = Asf(i);
        for j = 1:nfs
            f= fs(j);
            
            if Af >= f
                ratio = Af / f;
            else
                ratio = f / Af;
            end
            
            if ratio <= threshold
               ret(i) = pks(j);
            end
        end
    end