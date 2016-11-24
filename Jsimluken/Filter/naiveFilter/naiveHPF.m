function res = naiveHPF(x,fs,fe)
    step = 2048;
    len = 4096;
    [y,~,~] = stft(x,@hann,step,len,fs);
    rate = fs/len;
    fe = floor(fe/rate);
    y(2:fe,:) = 0;
    fe_ = len + 2 -fe;
    y(fe_:len,:) = 0;
    res = istft(y,@hann,step,len);
return