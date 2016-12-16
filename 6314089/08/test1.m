%path = '../../ModelAudio/kaeru.wav';
%path = '../../ModelAudio/kirakira.wav';
path = '../../ModelAudio/Fuer Elise11.wav';

frame1 = 32768;
step1 = 5000;
gamma1 = 0.3;
w1 = 1.2;
u1 = 1.2;
n1 = 30;

frame2 = 4096;
step2 = 2048;
gamma2 = 0.3;
w2 = 0.95;
u2 = 0.95;
n2 = 30;

audio = true;

[~, ~, ~] = multi_hpss(...
    path, ...
    frame1, step1, gamma1, w1, u1, n1, ...
    frame2, step2, gamma2, w2, u2, n2, ...
    audio);