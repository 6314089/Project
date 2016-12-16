function [F, ins] = makeLabeledData(sourceDir, instruments)
    ext = '.wav';
    omega = 4096;
    command = '';
    slash = '';
    if ismac
        command = 'ls';
        slash = '/';
    else
        command = 'dir /b';
        slash = '\';
    end
    F = [];
    ins = cell(size(instruments, 1), 1);
    % Loop for instruments
    for j = 1:size(instruments, 1)
        subDir = instruments{j};
        targetDir = strcat(sourceDir, slash, subDir, slash);
        [~,cmdout] = unix(strcat(command, [' ', targetDir, '*', ext]));
        files = strsplit(cmdout);
        currentSize = size(F, 2);
        additionalSize = size(files, 1);
        F = [F, zeros(omega, additionalSize)];
        tempIns = lower(subDir(1:2));   % The name of the instument of this loop
        disp(tempIns);
        % Loop for pitch
        for i = 1:(size(files,2)-1)
            name = char(files(i));  % ???
            if ismac
                slsPos = strfind(name, '/');    % Temp var to get file name
                fileName = name(slsPos(length(slsPos)) + 1:length(name) - length(ext));
            else
                fileName = name(1:length(name) - length(ext));
                name = [targetDir, name];
            end
            %disp(tempIns);
            %disp(fileName);
            tempIns = [tempIns; fileName];  % Don't know how to create a char array with specific length
            ad = audioread(name);
            if size(ad,2) >1
                ad = (ad(:,1) + ad(:,2))/2;
            end
            st = fft(ad(1:omega)); 
            F(:, i + currentSize) = abs(st)';
        end
        ins{j} = tempIns;
    end
return