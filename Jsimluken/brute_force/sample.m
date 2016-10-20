b = audioread('..Assets/B_A1.m4a');
g = audioread('..Assets/G_E2.m4a');
gb = audioread('..Assets/GB.m4a');

b = b(20000:40000,1);
g = g(20000:40000,1);
gb = gb(20000:40000,1);

sb = abs(fft(b));
sg = abs(fft(g));
sgb = abs(fft(gb));

[res1,res2] = atmSeparater(sgb,sb,sg);
eval1 = evalSpectrum(sb,res1);
eval2 = evalSpectrum(sg,res2);

%r1 = ifft(res1);
%sound(r1,44100);
%pause(1)
%r2 = ifft(res2);
%sound(r2,44100);