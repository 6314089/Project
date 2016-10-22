[data, Fs] = audioread('../Audio/drums_120bpm.wav');
vol = vol_quantize(data, 4410);
vol_diff = diff_p(vol);
bpm = bpm_match(vol_diff, 4410, Fs);

subplot(3, 1, 1)
plot(vol)

subplot(3, 1, 2)
plot(vol_diff)

subplot(3, 1, 3)
plot(60:240, bpm)