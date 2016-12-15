function [F, ins] = makeLabeledData(sourceDir, instruments)
    ext = '.wav';
    omega = 4096;
    command = '';
    if ismac
        command = 'ls *.wav';
    else
        command = 'dir /b ';
    end
    F = [];
    ins = cell(length(instruments));
    for j = 1:length(instruments)
        subDir = instruments(j);
        targetDir = strcat(sourceDir, '/', subDir);
        [~,cmdout] = unix(strcat(command, subDir));
        files = strsplit(cmdout);
        % Discard files w/o a specific extension
        files = files(endsWith(files, ext));
        preSize = size(F, 2);
        additionalSize = size(files, 2);
        F = [F, zeros(omega, additionalSize)];
        tempIns = zeros(1, additionalSize);
        for i = 1:(size(files,2)-1)
            fileName = char(files(i));
            tempIns(i) = strcat(subDir, fileName(1:length(fileName) - length(ext)));
            name = strcat(targetDir, fileName);
            ad = audioread(name);
            if size(ad,2) >1
                ad = (ad(:,1) + ad(:,2))/2;
            end
            st = fft(ad(1:omega)); 
            F(:, i + preSize) = abs(st)';
        end
        ins(j) = tempIns;
    end
return