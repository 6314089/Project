function y =  testNMF()
    step = 2048;
    length = 4096;
    window = @hann;
    rank = 5;
    [x,fs] = audioread('~/Assets/Riff2.wav');
    x = (x(:,1)+x(:,2))/2;
    l = mod((size(x,1)-length),step);
    y = zeros(size(x,1)-l,rank);
    sg = stft(x,window,step,length,fs);
    phase = angle(sg);
    Y = abs(sg);
    [H,U] = d_nmf(Y,rank);
    for i = 1:rank
       % disp(size(x))
        %disp(size(reconstruct(H,U,phase,step,length,window,i)));
        y(:,i) = reconstruct(H,U,phase,step,length,window,i);
    end
end