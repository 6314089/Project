function p = diff_midi(data1,data2)
    p = 0;
    error = 0;
    l1 = size(data1,1);
    l2 = size(data2,1);
    l = min(l1,l2);
    for i = 1:l
        if data1(i) ~= data2(i)
            error = error + 1;
        end
    end
    p = error/l;
return