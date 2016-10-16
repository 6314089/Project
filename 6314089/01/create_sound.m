function create_sound(filename, T, varargin)
    Fs = 44100;
    t = 0:(1/Fs):T;
    
    y = zeros(1, length(t));
    
    n = floor(length(varargin)/2);
    for k = 1:n
        type = varargin{1+2*(k-1)};
        f = varargin{2+2*(k-1)};
        switch type
            case 'sin'
                y = y + sin(2*pi*f*t);
            case 'saw'
                y = y + sawtooth(2*pi*f*t);
            case 'tri'
                y = y + sawtooth(2*pi*f*t, 0.5);
            case 'squ'
                y = y + square(2*pi*f*t);
            otherwise
                disp('Error: type is one of: sin, saw, tri, squ')
        end
    end
    
    audiowrite(filename, y, Fs)