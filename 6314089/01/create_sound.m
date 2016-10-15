function create_sound(filename, T, type, f)
    Fs = 44100;
    t = 0:(1/Fs):T;
    
    switch type
        case 'sin'
            audiowrite(filename, sin(2*pi*f*t), Fs)
        case 'saw'
            audiowrite(filename, sawtooth(2*pi*f*t), Fs)
        case 'tri'
            audiowrite(filename, sawtooth(2*pi*f*t, 0.5), Fs)
        case 'squ'
            audiowrite(filename, square(2*pi*f*t), Fs)
        otherwise
            disp('Error: type is one of: sin, saw, tri, squ')
    end