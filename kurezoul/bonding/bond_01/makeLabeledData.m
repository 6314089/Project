function [F,sg] = makeLabeledData(direct_path)
    omega = 4096;
    command = '';
    if ismac
        command = 'ls /';
    else
        command = 'dir /b ';
    end
    command = [command,direct_path];
    
    [~,cmdout] = unix(command);
    files = strsplit(cmdout);
    F = zeros(omega,size(files,2)-1);
    sg = zeros(omega,size(files,2)-1);
    for i = 1:(size(files,2)-1)
        name = strcat('F/',char(files(i)));
        ad = audioread(name);
        if size(ad,2) >1
            ad = (ad(:,1) + ad(:,2))/2;
        end
        st = fft(ad(1:omega)); 
        F(:,i) = abs(st)';
        sg(:,i) = st';
    end
return