path = '../../ModelAudio/kaeru.wav';

window = 2048;
step = 1024;
gamma = 0.3;
w = 0.5;
u = 0.5;
num = 30;

[~, ~] = hpss(path, window, step, gamma, w, u, num);