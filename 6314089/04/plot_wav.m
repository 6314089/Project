[data, Fs] = audioread('../Audio/drums_120bpm.wav');
n = length(data);

x = (1:n)/Fs;
y = data;


subplot(2, 3, 1);

plot(x, y);
xlabel('時刻 [s]');
ylabel('振幅 data');
title('全体');


subplot(2, 3, 2);

plot(x(1:Fs), y(1:Fs));
xlabel('時刻 [s]');
ylabel('振幅 data');
title('最初の1秒のサンプル');


subplot(2, 3, 3);

plot(x(1:floor(Fs/2)), y(1:floor(Fs/2)));
xlabel('時刻 [s]');
ylabel('振幅 data');
title('最初の0.5秒のサンプル');


subplot(2, 3, 4);

plot(x, abs(y));
xlabel('時刻 [s]');
ylabel('振幅 abs(data)');
title('全体(絶対値)');


subplot(2, 3, 5);

plot(x(1:Fs), abs(y(1:Fs)));
xlabel('時刻 [s]');
ylabel('振幅 abs(data)');
title('最初の1秒のサンプル(絶対値)');


subplot(2, 3, 6);

plot(x(1:floor(Fs/2)), abs(y(1:floor(Fs/2))));
xlabel('時刻 [s]');
ylabel('振幅 abs(data)');
title('最初の0.5秒のサンプル(絶対値)');
