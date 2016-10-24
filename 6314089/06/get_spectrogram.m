function [X, N, K] = get_spectrogram(X, gamma)
[k, n] = size(X);
K = ceil(k / 2);
N = n;
X = X(1:K, :);
X = abs(X).^gamma;