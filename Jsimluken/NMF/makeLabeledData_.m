function [F,filesnames] = makeLabeledData(directory,instruments)
    omega = 4096;
    command = '';
    %instruments = ['bass';'piano','drum'];
    
    %for i = instruments
    if ismac
        command = 'ls F3/';
    else
        command = 'dir /b F3';
    end
    [~,cmdout] = unix(command);
    files = strsplit(cmdout);
    F = zeros(omega,size(files,2)-1);
    sg = zeros(omega,size(files,2)-1);
    for i = 1:(size(files,2)-1)
        name = strcat('F3/',char(files(i)));
        ad = audioread(name);
        if size(ad,2) >1
            ad = (ad(:,1) + ad(:,2))/2;
        end
        st = fft(ad(1:omega)); 
        F(:,i) = abs(st)';
        sg(:,i) = st';
    end
return