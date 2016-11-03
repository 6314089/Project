b_a1 = audioread('../Assets/B_A1.m4a');
b_b1 = audioread('../Assets/B_B1.m4a');
b_g1 = audioread('../Assets/B_G1.m4a');

g_a2 = audioread('../Assets/G_A2.m4a');
g_d2 = audioread('../Assets/G_D2.m4a');
g_e2 = audioread('../Assets/G_E2.m4a');
g_f2 = audioread('../Assets/G_F2.m4a');

gb = audioread('../Assets/GB.m4a');


b_a1 = b_a1(20000:40000,1);
b_b1 = b_b1(20000:40000,1);
b_g1 = b_g1(20000:40000,1);

g_a2 = g_a2(20000:40000,1);
g_d2 = g_d2(20000:40000,1);
g_e2 = g_e2(20000:40000,1);
g_f2 = g_f2(20000:40000,1);

gb = gb(20000:40000,1);

sb_a1 = abs(fft(b_a1));
sb_b1 = abs(fft(b_b1));
sb_g1 = abs(fft(b_g1));
sb = [sb_a1,sb_b1,sb_g1];

sg_e2 = abs(fft(g_e2));
sg_a2 = abs(fft(g_a2));
sg_d2 = abs(fft(g_d2));
sg_f2 = abs(fft(g_f2));
sg = [sg_a2,sg_d2,sg_e2,sg_f2];

sgb = abs(fft(gb));

[indexSb,indexSg] = brute_force(sgb,sb,sg);