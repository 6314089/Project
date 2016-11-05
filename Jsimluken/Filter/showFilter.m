function res = showFilter(b,fs)
    N = size(b,2);
    freqList = 1:N;
    freqList = freqList * fs/N;
    y = fft(b);
    e = floor(N/2);
    plot(freqList(1:e),abs(y(1:e)));
return 