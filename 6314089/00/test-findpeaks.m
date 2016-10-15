x = 0:100;
y1 = sin(x);
y2 = sin(x) + rand(1, 101);

pks = findpeaks(y1);
pks'

[pks, locs] = findpeaks(y2);
pks'
locs'

findpeaks(y2);



f = 440;
Fs = 44100;
T = 1;
t = 0:(1/Fs):T;

y3 = sin(2*pi*f*t);

[pks, locs] = findpeaks(y3);
pks(1:3)
locs(1:3)

[pks, locs] = findpeaks(y3, Fs);
pks(1:3)
locs(1:3)