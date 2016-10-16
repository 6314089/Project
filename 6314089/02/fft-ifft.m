%[input, Fs] = audioread('../Audio/A4_saw.wav');
[input, Fs] = audioread('../Audio/A4_sin_F4_saw.wav');

m = length(input); %window length
n = 2^nextpow2(m);
Y = fft(input, n);
f = (0:n-1)*(Fs/n);

plot(f, abs(Y))
axis([0, 22050, 0, 30000])


%findpeaks(abs(Y(1:50000)), 'MinPeakHeight', 5000);
findpeaks(abs(Y(1:50000)), 'MinPeakProminence', 2500);
axis([0, 22050, 0, 30000])
%[pks, locs] = findpeaks(abs(Y), 'MinPeakHeight', 5000);
[pks, locs] = findpeaks(abs(Y), 'MinPeakProminence', 2500);


YY = zeros(1, n);

nLocs = length(locs);
for k = 1:nLocs
    YY(locs(k)) = Y(locs(k));
end



y = ifft(YY);
y = y(1:m);

sound(input, Fs)
pause(2.5)
sound(y, Fs)
