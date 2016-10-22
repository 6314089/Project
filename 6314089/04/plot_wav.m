[data, Fs] = audioread('../Audio/drums_120bpm.wav');
n = length(data);

x = (1:n)/Fs;
y = data;


subplot(2, 3, 1);

plot(x, y);
xlabel('���� [s]');
ylabel('�U�� data');
title('�S��');


subplot(2, 3, 2);

plot(x(1:Fs), y(1:Fs));
xlabel('���� [s]');
ylabel('�U�� data');
title('�ŏ���1�b�̃T���v��');


subplot(2, 3, 3);

plot(x(1:floor(Fs/2)), y(1:floor(Fs/2)));
xlabel('���� [s]');
ylabel('�U�� data');
title('�ŏ���0.5�b�̃T���v��');


subplot(2, 3, 4);

plot(x, abs(y));
xlabel('���� [s]');
ylabel('�U�� abs(data)');
title('�S��(��Βl)');


subplot(2, 3, 5);

plot(x(1:Fs), abs(y(1:Fs)));
xlabel('���� [s]');
ylabel('�U�� abs(data)');
title('�ŏ���1�b�̃T���v��(��Βl)');


subplot(2, 3, 6);

plot(x(1:floor(Fs/2)), abs(y(1:floor(Fs/2))));
xlabel('���� [s]');
ylabel('�U�� abs(data)');
title('�ŏ���0.5�b�̃T���v��(��Βl)');
