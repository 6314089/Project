function res = convert(data,step,frameLen)
    [rank,num] = size(data);
    signalLen = (num - 1) * step + frameLen;
    res = zeros(rank,signalLen);
    s = 1;
    e = frameLen;
    for i = 1:num
        for j = 1:rank
           if data(j,i) ~=2
                res(j,s:e) = data(j,i);
           else 
               res(j,s:e) = 1;
               res(j,s) = 2;
           end
        end
        s = s + step;
        e = e + step;
    end
return
    