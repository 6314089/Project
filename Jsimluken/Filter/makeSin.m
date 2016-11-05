function data = makeSin(dur,hz)
    t = (0.0:2*pi/44100:2*pi*dur)';
    data = sin(hz*t);
    sound(data,44100);