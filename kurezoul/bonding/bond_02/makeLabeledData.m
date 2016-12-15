function [F, ins] = makeLabeledData(sourceDir, instruments)
    ext = '.wav';
    omega = 4096;
    command = '';
    if ismac
        command = strcat('ls');
    else
        command = 'dir /b';
    end
    F = [];
    ins = cell(size(instruments, 1), 1);
    for j = 1:size(instruments, 1);
        subDir = instruments(j, :);
        targetDir = strcat(sourceDir, '/', subDir, '/');
        [~,cmdout] = unix(strcat(command, [' ', targetDir, '*', ext]));
        files = strsplit(cmdout);
        preSize = size(F, 2);
        additionalSize = size(files, 1);
        F = [F, zeros(omega, additionalSize)];
        tempIns = [];
        for i = 1:(size(files,2)-1)
            fileName = char(files(i));
            slsPos = strfind(fileName, '/');
            tempIns = [tempIns; fileName(slsPos(length(slsPos)) + 1:length(fileName) - length(ext))];
            name = strcat(fileName);
            ad = audioread(name);
            if size(ad,2) >1
                ad = (ad(:,1) + ad(:,2))/2;
            end
            st = fft(ad(1:omega)); 
            F(:, i + preSize) = abs(st)';
        end
        ins{j} = tempIns;
    end
return