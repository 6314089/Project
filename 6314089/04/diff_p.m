function D = diff_p(v)
    vp = [0 v];
    vp = vp(1:length(v));
    diff = v - vp;
    flag = diff >= 0;
    D = diff .* flag;