function ret = istft(data, width, step)
ndata = size(data, 2);
nret = (ndata - 1) * step + width;
ret = zeros(nret, 1);
c = zeros(nret, 1);
for k = 1:ndata
    s = (k - 1) * step + 1;
    e = s + width - 1;
    
    y = (ifft(data(:, k)) ./ hann(width));
    
    i = s:e;
    i = i(hann(width) ~= 0);
    
    ret(i) = ret(i) +  y(hann(width) ~= 0);
    c(i) = c(i) + ones(length(i), 1);
end
for k = 1:nret
    ret(k) = ret(k) / c(k);
end

    