#01

MATLABでwavファイルを生成するテスト．

[create_sound.mについてはこちら](/6314089/01/create_sound.md)

##play.m
とりあえず音を鳴らしてみる．

    f = 440;
    Fs = 44100;
    T = 1;
    t = 0:(1/Fs):T;

    y = sin(2*pi*f*t);

    sound(y, Fs);

`f`が音の周波数．ここではA2．

`Fs`がサンプリングレート．ここでは44100Hz = 44.1kHz．

`T`が音の長さ．1秒間鳴らす．

`t`で0から`T`までのサンプリングレート間隔のベクトルを生成．

'y'で2PIに`f`掛けたものに`t`を掛けて`sin`に入れることで，440Hzのサイン波を作ってる．

`sound`関数でデータ`y`とサンプリング周波数`Fs`をわたしてやることで音を鳴らしてる．

##white_noise.m
play.mにホワイトノイズを足して音を鳴らしてみる．

    f = 440;
    Fs = 44100;
    T = 1;
    t = 0:(1/Fs):T;

    y = sin(2*pi*f*t);

    y = y + 0.1 * randn(size(t));

    sound(y, Fs);

`randn`で正規分布の乱数を生成できる．
A2のサイン波の`y`にノイズを重ねている．

ノイズ除去とかやりたいならば，こうやって作ったものを使って実験してみるのもいいかもしれない．

##ex_audiowrite.m
このプログラムを実行すると，sin.wav，saw.wav，tri.wav，squ.wavと言うファイルが実行ディレクトリに生成される．
それぞれA2のサイン波，ノコギリ波，三角波，矩形波になっていると思う．


    f = 440;
    Fs = 44100;
    T = 1;
    t = 0:(1/Fs):T;


    y1 = sin(2*pi*f*t);

    audiowrite('sin.wav', y1, Fs)


    y2 = sawtooth(2*pi*f*t);

    audiowrite('saw.wav', y2, Fs)


    %triangle wave
    y3 = sawtooth(2*pi*f*t, 0.5);
    plot(t,y3)
    axis([0 0.01 -1 1])

    audiowrite('tri.wav', y3, Fs)


    y4 = square(2*pi*f*t);

    audiowrite('squ.wav', y4, Fs)


`audiowrite`関数を利用する.
https://jp.mathworks.com/help/matlab/ref/audiowrite.html

`audiowrite`にファイル名とオーディオデータとサンプルレートを入れるとオーディオファイルを書き出してくれる．書き出しオーディオファイルの形式はファイル名で指定する．
ファイル名に`.wav`とつけておけばwavファイルで保存されるっぽい．


`sawtooth`関数はノコギリ波を作ってくれる．
https://jp.mathworks.com/help/signal/ref/sawtooth.html

ノコギリのピークの位置を0～1で指定してやることができる．0.5にすれば三角波になっている．三角波になってることを確認するためにグラフを書いてる．

'square'関数で矩形波を出力できる．
https://jp.mathworks.com/help/signal/ref/sawtooth.html


##create_sound.m
[create_sound.mについて](/6314089/01/create_sound.md)
