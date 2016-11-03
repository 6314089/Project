path = '../../ModelAudio/kaeru.wav';

window = 2048;
step = 512;
gamma = 0.3;
w = 1;
u = 1;
num = 30;

[~, ~] = hpss(path, window, step, gamma, w, u, num);