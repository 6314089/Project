function res = findSE(data)
    %isRing = false;
    %length = size(data,2);
    [~,S] = findpeaks(data);
    eventCounts = size(S,2);
    res = zeros(eventCounts,2);
    %disp(eventCounts);
    for i = 1:eventCounts
        res(i,1) = S(i);
        j = S(i)+1;
        while(data(j)~=0)
            j = j + 1;
        end
        res(i,2) = j;
    end


return