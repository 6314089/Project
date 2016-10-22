function R = bpm_match(v, N, Fs)
    nv = length(v);
    R = zeros(1, 240-60+1);
    
    for bpm = 60:240
        a = zeros(1, nv);
        b = zeros(1, nv);
        for k = 1:nv
            a(k) = v(k) * cos(2*pi * (bpm/60) * (k / (Fs/N)));
            b(k) = v(k) * sin(2*pi * (bpm/60) * (k / (Fs/N)));
        end
        
        R(bpm-60+1) = sqrt((sum(a)/N)^2 + (sum(b)/N)^2);
    end