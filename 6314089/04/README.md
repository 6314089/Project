#04
ドラムパターンの振幅の変化について調べてみる．
ドラムだけを抽出できればテンポ解析ができそうなのかどうかを調べる．

[drums_120bpm.wav](/6314089/Audio/drums_120bpm.wav)

##ドラム音源の振幅をプロットしてみる
plot_wav.mで音源の振幅をプロットをみる．

![img0](/6314089/04/img/0.png)

大体120bpmで音量が尖っていることが分かる．

細かく見ると振動をしているから，単純にピークを持ってくるだけだと訳がわからなくなりそうだけれども．
閾値を取ってピークを取ってくるとかすれば十分なんとかなりそう．
ある程度平滑化する必要もあるかもしれない．

##bpmを求める
http://hp.vector.co.jp/authors/VA046927/tempo/tempo.html
を参考にして実装をする．

bpm.mがその実装になっている．
データとサンプリングレートとフレームの大きさを与えると，bpmの候補が3つ返ってくる．

test4.mが実際にbpm.mを利用しているスクリプト．
上に上げたdrums_120bpm.wavについて120とか240と言った値を返している．
だいたい成功かな．

参考にしたページの周波数成分を求めるのが何をやっているのか良く分からない．
あるbpmでのsinとcosを，元のデータにかけ合わせたものを大きくするように求めているのだろうけれども．
周期というと自己相関係数とかを思いつくが，これはそれと同じことをやっているのかしら？

##使ってみる
test5.m

    [data, Fs] = audioread('../Audio/drums_120bpm.wav');
    bpm(data, Fs, 500)

    [data, Fs] = audioread('../Audio/drums_180bpm.wav');
    bpm(data, Fs, 500)

    [data, Fs] = audioread('../Audio/drums_165bpm.wav');
    bpm(data, Fs, 500)

実行結果

    ans =

       240   120   239


    ans =

       180   181   179


    ans =

       166   165   100

二倍のbpmがでたりしているけどだいたいいいんじゃないかな．

フレームの大きさを大きくしたら上手く行かないこともあった．
あまりフレームを小さくすると処理が時間かかりそうだけどね．



[vol_quantize.mについての説明](/6314089/04/vol_quantize.md)
