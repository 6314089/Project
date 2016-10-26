window = 1024;
step = 512;
gamma = 0.3;
w = 1;
u = 1;
num = 30;

[~, ~] = hpss('../ModelAudio/all.wav', window, step, gamma, w, u, num);