#test3.m
plotで折れ線グラフを表示する．

plotのドキュメントは https://jp.mathworks.com/help/matlab/ref/plot.html

##1

    x = 0:10;
    y = [5 4 2 1 8 0 9 7 6 3 10];

    plot(x, y)

`x`には0から10までの連番の11個の要素のベクトルが入っている．
`y`にも11個の要素のベクトルが入っている．
`plot`関数に`x`と`y`を与えて折れ線グラフを描画する．

![img1](/6314089/00/img/1.png)


##2

    x = linspace(1, 100);
    y = randn(1, 100);

    figure
    plot(x, y, '--or')

`plot`の3つめの引数のLineSpecで線のスタイルを決める

`figure`で新しいウィンドウを作る．
`figure`しないとさっき書いたやつを上書きしてしまう．
さっきのとは別ウィンドウで描画するために`figure`を呼んでおく．

`linspace(1, 100)`は1～100までの等間隔の点を100個含む行ベクトルを返す．

`randn(1, 100)`は1列100行の正規分布からなる乱数を返す．

LineSpecの書式についてはドキュメントを読もう．

![img2](/6314089/00/img/2.png)

折れ線が赤い点線になって，点が○でプロットされている．


##3

plotした後にラベルやタイトルなどを追加する．

`0:(pi/100):(2*pi)`で0から2PIまでPI/100単位で刻んだものを要素とする行ベクトルを返す．

`sin(x)`でxの各要素についてsinを適用した行ベクトルを返す．

    x = 0:(pi/100):(2*pi);
    y = sin(x);

    figure
    plot(x, y)
    xlabel('x')
    ylabel('sin(x)')
    title('Plot of the Sine Function')

![img3](/6314089/00/img/3.png)

##4
stemで棒グラフを描画する．

    x = 1:20;
    y = randn(1, 20);

    figure
    stem(x, y)

![img4](/6314089/00/img/4.png)

##5
複数のデータを同時にプロットする．

    x0 = 1:20;
    y0 = randn(1, 20);
    x1 = 1:20;
    y1 = randn(1, 20);

    figure
    plot(x0, y0, x1, y1)

![img5](/6314089/00/img/5.png)

##6
複数の線に対してスタイルをあてる．

    x0 = 1:20;
    y0 = randn(1, 20);
    x1 = 1:20;
    y1 = randn(1, 20);

    figure
    plot(x0, y0, ':xg', x1, y1, '-.dk')

![img6](/6314089/00/img/6.png)

##7
詳細にスタイルを与える．

    x = 1:20;
    y = randn(1, 20);

    figure
    plot(x, y, ...
        'Color', [0.4 0.6 0.7], ...
        'LineWidth', 1.5, ...
        'Marker', 's', ...
        'MarkerEdgeColor', 'k')

一行に収まらないときは`...`を書くことで次の行に続けることができる．
適宜`...`で開業することで見やすいコードになるかもね．
https://jp.mathworks.com/help/matlab/matlab_prog/continue-long-statements-on-multiple-lines.html

設定の名前と値を順番に与えていっている．
設定の項目に関してはドキュメントを参照．
https://jp.mathworks.com/help/matlab/ref/plot.html#namevaluepairarguments

![img7](/6314089/00/img/7.png)

線の太さと色，そしてプロットの形と色を変えている．

##8
`hold on`で新しくデータを追加する．

    x = 0:(pi/100):(2*pi);
    y0 = sin(x);
    y1 = cos(x);

    figure
    plot(x, y0)

    hold on
    plot(x, y1)

    legend('sin', 'cos')

5番では同時に複数の値を与えていたが，ここでは一度プロットした後にさらにデータを追加している．

![img8](/6314089/00/img/8.png)

##9
subplotで幾つかの表をまとめる．

subplotについては https://jp.mathworks.com/help/matlab/creating_plots/create-graph-with-subplots.html

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

![img9](/6314089/00/img/9.png)
