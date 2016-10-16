[y, Fs] = audioread('../Audio/A4_saw.wav');

m = length(y); %window length
n = 2^nextpow2(m);
Y = fft(y, n);
f = (0:n-1)*(Fs/n);

plot(f, abs(Y))
axis([0, 22050, 0, 30000])


%findpeaks(abs(Y(1:50000)), 'MinPeakHeight', 5000);
findpeaks(abs(Y(1:50000)), 'MinPeakProminence', 2500);
axis([0, 22050, 0, 30000])
%[pks, locs] = findpeaks(abs(Y), 'MinPeakHeight', 5000);
[pks, locs] = findpeaks(abs(Y), 'MinPeakProminence', 2500);

length(pks)

fs = locs*(Fs/n);

fs(1:6)

pks(1:6)