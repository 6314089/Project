%path = '../../ModelAudio/kaeru.wav';
path = '../../ModelAudio/kirakira.wav';
%path = '../../ModelAudio/Fuer Elise11.wav';

frame1 = 2048;
step1 = 500;
gamma1 = 0.3;
w1 = 0.95;
u1 = 1;
n1 = 30;

frame2 = 32768;
step2 = 5000;
gamma2 = 0.3;
w2 = 1.05;
u2 = 1;
n2 = 30;

audio = true;

[~, ~, ~] = multi_hpss2(...
    path, ...
    frame1, step1, gamma1, w1, u1, n1, ...
    frame2, step2, gamma2, w2, u2, n2, ...
    audio);