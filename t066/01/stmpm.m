%****************************************************
% Like STFT
% Pre:
%       *first 4 params are used to call mpm
%       step   = window shifting rate per loop
%****************************************************
function stmpm(signal, fs, len, k, step)
    start = 1;
    xn = 1;
    hzs = 0;
    if length(signal) >= step && step > 0    
        loop = floor(length(signal) / step);
        hzs = zeros(loop + 2, 1);
        for xn = 1:loop
            hzs(xn) = mpm(signal(start:end), fs, len, k);
            start = start + step;
        end
    end
    hzs(xn) = mpm(signal(start:end), fs, len, k);
    plot(hzs);
end