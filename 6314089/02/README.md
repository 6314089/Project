#02

fft及びifftを利用してみるテスト．


##audioread

    [y0, Fs] = audioread('../Audio/A4_sin.wav');
    [y1, Fs] = audioread('../Audio/A4_tri.wav');
    [y2, Fs] = audioread('../Audio/A4_sin_A4_saw.wav');
    [y3, Fs] = audioread('../Audio/A4_tri_F4_tri.wav');

    subplot(2, 2, 1)
    plot(y0(1:300))

    subplot(2, 2, 2)
    plot(y1(1:300))

    subplot(2, 2, 3)
    plot(y2(1:300))

    subplot(2, 2, 4)
    plot(y3(1:300))

    sound(y0, Fs)
    pause(2.5)
    sound(y1, Fs)
    pause(2.5)
    sound(y2, Fs)
    pause(2.5)
    sound(y3, Fs)

`[y, Fs] = audioread(filename)`でオーディオデータを読み込める．
`y`はm×nの行列でmがサンプル数，nがオーディオのチャンネル数．
今回はモノラルなのでyはただのベクトルなのかな．

一部分だけ取ってきてプロットをしてみたり，音を鳴らしたりしてきちんとファイルを読み込めていることを確認した．

![img0](/6314089/02/img/00.png)


##fft-ifft

もとの音をスペクトル分解して，ピークの部分だけを取り出して，
それをもとにifftして信号を再現するスクリプト．

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

fftは2のべき乗のサンプル数だと実行速度が速いらしい．
そこで，元データのサンプル数mを以上の最小の2のベキ乗の数をnとして，
そのnを利用してfftを行ってる．
nがサンプル数より大きいときは0埋めしてくれるが，
それによってほとんど結果は変わらないそう．
https://jp.mathworks.com/help/matlab/math/fast-fourier-transform-fft.html

findpeaksを二回やっているのは一回目はグラフを表示するために使っているから．

プロミネンスとかいうのを使うとうまい感じでピークが取ってこれた．
プロミネンスが何者かはよく分かっていない．

YYはピークの部分のみ値を持っていて，それ以外は0になっているベクトルを作っている．
最初に0埋めしておいて，Yにfindpeaksかけて見つかったlocsの場所だけYYにYの値を代入することで，Yのfindpeaksで見つけたピークだけを取り出したYYを生成した．

そのYYをifftにかけてyに入れる．
さらに，2のべき乗にするためにサンプル数を増やしているから，
mでもとの長さに戻してyとした．


最後に，もとの信号と，fftかけたスペクトル解析のピークの周波数のデータだけをもとに，ifftをかけて復元した信号とを順番に再生している．

復元したやつは高周波が削れてたりして，元の音とはちょっと別のになっているけれども，ピークの周波数のデータだけからある程度は音を再現できたよう．


スペクトル解析のピークを取り出すってのは，基音と倍音だけを取り出してるってことかな．
基音と倍音だけを取り出して，それをもとに音を再現した．

基音と倍音成分のデータだけでなんとかなるならば，信号分離の際の連立方程式を立てる際に，元信号と調べたい信号のサンプル数を揃えてサンプル点分のデータ全部を連立方程式につかう必要はなくなるかもしれない．


音がおかしくなった原因は，
高周波の倍音とかはしきい値の関係上，上手く拾えなかったことかな．
fftでは後半のデータが役に立たないので，22050Hz以上の周波数が切り捨てられているのも原因かも知れない．
そもそも今回は切り捨てるコードを入れていないから，それが原因かもしれない．
