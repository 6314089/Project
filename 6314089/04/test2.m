[data, Fs] = audioread('../Audio/drums_120bpm.wav');
vol = vol_quantize(data, 4410);
vol_diff = diff_p(vol);

subplot(2, 1, 1)
plot(vol)

subplot(2, 1, 2)
plot(vol_diff)