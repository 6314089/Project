function F = makeLabeledData()
    omega = 44100*2;
    command = 'ls F/';
    [~,cmdout] = unix(command);
    files = strsplit(cmdout);
    F = zeros(omega,size(files,2)-1);
    for i = 1:(size(files,2)-1)
        name = strcat('F/',char(files(i)));
        ad = audioread(name);
        if size(ad,2) >1
            ad = (ad(:,1) + ad(:,2))/2;
        end
        st = abs(fft(ad(1:omega))); 
        F(:,i) = st';
    end
return