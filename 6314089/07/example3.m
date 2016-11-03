path = '../../ModelAudio/kaeru.wav';

window = 2048;
step = 512;
gamma = 0.3;
w = 1;
u = 1;
num = 30;

[H, P] = hpss(path, window, step, gamma, w, u, num);

X = H(1:100, :);
im = imagesc(abs(X).^(0.3));
im.Parent.YDir = 'normal';
colorbar;

figure;

X = P(1:100, :);
im = imagesc(abs(X).^(0.3));
im.Parent.YDir = 'normal';
colorbar;
