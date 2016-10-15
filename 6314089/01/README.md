#01

MATLABでwavファイルを生成するテスト．

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
https://jp.mathworks.com/help/matlab/ref/audiowrite.html

`audiowrite`関数を利用する.

    f = 440;
    Fs = 44100;
    T = 1;
    t = 0:(1/Fs):T;

    y = sin(2*pi*f*t);

    audiowrite('sin.wav', y, Fs)

`audiowrite`にファイル名とオーディオデータとサンプルレートを入れるとオーディオファイルを書き出してくれる．書き出しオーディオファイルの形式はファイル名で指定する．
ファイル名に`.wav`とつけておけばwavファイルで保存されるっぽい．
