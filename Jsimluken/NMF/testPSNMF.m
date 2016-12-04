function [y1,y2] =  testPSNMF()
    step = 2048;
    length = 4096;
    window = @hann;
    rank = 5;
    mew = 1;
    [x,fs] = audioread('~/Assets/Riff2.wav');
    x = (x(:,1)+x(:,2))/2;
    l = mod((size(x,1)-length),step);
    sg = stft(x,window,step,length,fs);
    phase = angle(sg);
    Y = abs(sg);
    F = makeLabeledData();
    [G,H,U] = psnmf(Y,F,rank,mew);
    y1 = zeros(size(x,1)-l,rank);
    y2 = zeros(size(x,1)-l,rank);
    for i = 1:rank
       % disp(size(x))
        %disp(size(reconstruct(H,U,phase,step,length,window,i)));
        y1(:,i) = reconstruct(H,U,phase,step,length,window,i);
        y2(:,i) = reconstruct(F,G,phase,step,length,window,i);
    end
end