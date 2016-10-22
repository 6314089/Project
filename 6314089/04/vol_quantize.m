function vol = vol_quantize(data, N)
    ndata = length(data);
    K = ceil(ndata / N);
    
    vol = zeros(1, K);
    for k = 1:K
        a = N * (k-1) + 1;
        b = min(N * k, ndata);
        frame_data = data(a:b);
        vol(k) = sqrt(sum(frame_data .* frame_data) / N);
    end