function res = naiveBSF(x,fs,fe1,fe2)
    step = 2048;
    len = 4096;
    [y,~,~] = stft(x,@hann,step,len,fs);
    rate = fs/len;
    fe1 = floor(fe1/rate)+1;
    fe2 = floor(fe2/rate);
    y(fe1:fe2,:) = 0;
    fe1_ = len + 2 - fe1;
    fe2_ = len + 2 - fe2;
    y(fe2_:fe1_,:) = 0;
    res = istft(y,@hann,step,len);
return