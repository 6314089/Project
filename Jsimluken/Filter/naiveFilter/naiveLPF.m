function res = naiveLPF(x,fs,fe)
    step = 2048;
    len = 4096;
    [y,~,~] = stft(x,@hann,step,len,fs);
    rate = fs/len;
    fe = floor(fe/rate)+1;
    fe_ = len + 2 -fe;
    y(fe:fe_,:) = 0;
    res = istft(y,@hann,step,len);
return