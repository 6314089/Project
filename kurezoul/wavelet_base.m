function [spec_data,scale] = wavelet_base(mode,data_spec,fs,start,en,dt,dj,oct,init,mother) 

    if (nargin < 10), mother = 'non';end
    if (nargin < 9), init = -1;end
    if (nargin < 8), oct = -1; end
    if (nargin < 7), dj = -1; end
    if (nargin < 6), dt = -1; end
    if (nargin < 5)
        error('Must input a vector Data and wavelet transform mode,sample number start and end, sampling rate')
    end
    if start > en
        erroe('Must start bigger than end')
    end
    
    if dt == -1 ,dt = 1/fs;end
    if dj == -1, dj = 1/60;end    % this will do 60 sub-octaves per octave
    if init == -1,init = 55;end    % this says start at a scale of 6 months
    if oct == -1, oct = 8/dj;end    % this says do 8 powers-of-two with dj sub-octaves each
    if (strcmp(mother,'non')), mother = 'Morlet';end

% Wavelet transform:
    if mode == 1
        data = data_spec(start:en,1);
        [spec_data,scale] = wavelet_cwt(data,dt,dj,init,oct,mother);

    elseif mode == 2
        spec = data_spec;
        size = en - start + 1;
        [spec_data,scale] = wavelet_icwt(spec,size,dt,dj,init,oct,mother);
    else
        error('Mode must be 1 or 2')
    end

return