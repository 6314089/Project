function [y1,y2,F,G,H,U] =  testPSNMF()
    step = 2048;
    length = 4096;
    window = @hann;
    rank = 3;
    mew = 1;
    [x,fs] = audioread('sakurasakura.wav');
    x = (x(:,1)+x(:,2))/2;
    l = mod((size(x,1)-length),step);
    sg = stft(x,window,step,length,fs);
    phase = angle(sg);
    Y = abs(sg);
    F = makeLabeledData_();
    [G,H,U] = psnmf2(Y,F,rank,mew);
    y1 = zeros(size(x,1)-l,rank);
    y2 = zeros(size(x,1)-l,size(F,2));
    for i = 1:rank
        y1(:,i) = reconstruct(H,U,phase,step,length,window,i);
    end
    for k = 1:size(F,2)
        y2(:,k) = reconstruct(F,G,phase,step,length,window,k);
    end
    sepOut(F,G,fs,phase,step,length,'unko',{1:size(F,2)});
end