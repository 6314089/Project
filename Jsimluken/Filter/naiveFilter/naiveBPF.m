function res = naiveBPF(x,fs,fe1,fe2)
    step = 2048;
    len = 4096;
    [y,~,~] = stft(x,@hann,step,len,fs);
    tmp = zeros(size(y));
    rate = fs/len;
    fe1 = floor(fe1/rate)+1;
    fe2 = floor(fe2/rate);
    tmp(fe1:fe2,:) = y(fe1:fe2,:);
    fe1_ = len + 2 - fe1;
    fe2_ = len + 2 - fe2;
    tmp(fe2_:fe1_,:) = y(fe2_:fe1_,:);
    res = istft(tmp,@hann,step,len);
return