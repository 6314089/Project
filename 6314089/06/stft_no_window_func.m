function ret = stft_no_window_func(data, width, step)
if size(data, 1) == 1
    data = data';
end
ndata = length(data);
K = floor((ndata - width + step) / step);
ret = zeros(width, K);
for k = 1:K
    s = (k - 1) * step + 1;
    e = s + width -1;
    ret(:,k) = fft(data(s:e), width);
end