function ret = istft_no_window_func(data, width, step)
ndata = size(data, 2);
nret = (ndata - 1) * step + width;
ret = zeros(nret, 1);
c = zeros(nret, 1);
for k = 1:ndata
    s = (k - 1) * step + 1;
    e = s + width - 1;
    
    y = ifft(data(:, k), 'symmetric');
    
    i = s:e;
    
    ret(i) = ret(i) +  y;
    c(i) = c(i) + ones(length(i), 1);
end
for k = 1:nret
    ret(k) = ret(k) / c(k);
end

    