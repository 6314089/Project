function r = sample(c)
[y, fs] = audioread(c);
% Convert to mono
y = (y(:, 1) + y(:, 2)) / 2;
width = 4096*4;
step = 2048*4;
[stfted2, f2, t2] = stft(y, @hann, step, width, fs);
r = abs(stfted2(:,12));
phase2 = angle(stfted2);

%r = abs(y);
end
