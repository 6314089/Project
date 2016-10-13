function ar = maxPeak(sar)
    temp = size(sar(1, :)); %wanna get sar's col
    col = temp(2);
    ar = zeros(2, col); %bad coding
    counter = 1;
    while counter <= col
        max = 0;
        maxInd = 0;
        tempAr = sar(:, counter);
        index = 0;
        for p = transpose(tempAr)   %w/o transpose, p become an array
            index = index + 1;
            if(p > max)
                max = p;
                maxInd = index;
            end
        end
        if max > 0  % for threshold
            ar(1, counter) = ar(1, counter) + maxInd;
            ar(2, counter) = ar(2, counter) + max;
        else
            ar(1, counter) = 0;
            ar(2, counter) = 0;
        end
        counter = counter + 1;
    end
    return