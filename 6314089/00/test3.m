%plotで折れ線グラフを表示する
x = 0:10;
y = [5 4 2 1 8 0 9 7 6 3 10];

plot(x, y)


%figureで新しいウィンドウを作る．
%LineSpecで線のスタイルを決める
x = linspace(1, 100);
y = randn(1, 100);

figure
plot(x, y, '--or')


%ラベルを追加する
x = 0:(pi/100):(2*pi);
y = sin(x);

figure
plot(x, y)
xlabel('x')
ylabel('sin(x)')
title('Plot of the Sine Function')


%棒グラフを描画する
x = 1:20;
y = randn(1, 20);

figure
stem(x, y)


%複数のデータを同時にプロットする
x0 = 1:20;
y0 = randn(1, 20);
x1 = 1:20;
y1 = randn(1, 20);

figure
plot(x0, y0, x1, y1)


%複数の線に対してスタイルをあてる
x0 = 1:20;
y0 = randn(1, 20);
x1 = 1:20;
y1 = randn(1, 20);

figure
plot(x0, y0, ':xg', x1, y1, '-.dk')


%詳細にスタイルを与える
x = 1:20;
y = randn(1, 20);

figure
plot(x, y, ...
    'Color', [0.4 0.6 0.7], ...
    'LineWidth', 1.5, ...
    'Marker', 's', ...
    'MarkerEdgeColor', 'k')


%hold onで新しくデータを追加する
x = 0:(pi/100):(2*pi);
y0 = sin(x);
y1 = cos(x);

figure
plot(x, y0)

hold on
plot(x, y1)

legend('sin', 'cos')


%subplotで幾つかの表をまとめる
x = linspace(-5, 5);
y0 = sin(x);
y1 = sin(2*x);
y2 = sin(3*x);
y3 = y0 + y1 + y2;

figure

subplot(2, 2, 1)
plot(x, y0)
title('First subplot')

subplot(2, 2, 2)
plot(x, y1)
title('Second subplot')

subplot(2, 2, 3)
plot(x, y2)
title('Third subplot')

subplot(2, 2, 4)
plot(x, y3)
title('Fourth subplot')