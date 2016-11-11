function r = sample(c)
[y, fs] = audioread(c);
% Convert to mono
y = (y(:, 1) + y(:, 2)) / 2;
y = fft(y);

r = abs(y);
end
