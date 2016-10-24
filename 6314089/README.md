#6314089
##作ったもの
- [00: MATLABの使い方を勉強する](/6314089/00/README.md)
- [01: MATLABで音を生成する](/6314089/01/README.md)
- [02: fftとifftを試す](/6314089/02/README.md)
  スペクトル解析とピーク抽出で基音と倍音のデータを取得．
  そのデータをもとに信号を復元．  
- ~~[03: 音の分離を目指す](/6314089/03/README.md)~~
  上手く行かなかったので放棄．
- [04: ドラムパターンの解析](/6314089/04/README.md)

##参考リンク
ブラウザのタブを開きまくって重たくなってきたので，開いているタブをいくつかリンクにしておく．
使えるページから使えないページまで入っている．

これら以外にも色々勉強に使ったページはあったが，既にタブを閉じてしまった．ブラウザの履歴をたどってリンクを作るのはめんどい．

###各音の周波数
- [平均律の周波数表](http://www.floatgarden.net/flstudio/hz.htm)
  各音の周波数を知りたくなったときに
- [平均律音階周波数対応表](http://d.hatena.ne.jp/underthemoon/20081026/p1)
  上のがあれば十分な気もする

###楽器の音域
- [楽器と音域](http://www.asahi-net.or.jp/~hb9t-ktd/music/Japan/Instrument/range_gm.html)
様々な楽器の音域について．

###テンポ解析について
- [ピッチ解析・テンポ解析 ](https://www20.atwiki.jp/lovely-fruity/sp/pages/154.html)
- [テンポ解析のアルゴリズム ](http://ackiesound.ifdef.jp/doc/tempo/main.html)
- [【python】テンポ解析してみる【サウンドプログラミング】](http://ism1000ch.hatenablog.com/entry/2014/07/08/164124)
- [C/C++言語で音声ファイルのテンポ解析を行うサンプルプログラム](http://hp.vector.co.jp/authors/VA046927/tempo/tempo.html)

###MATLABのドキュメント
- [Signal Processing Toolbox 入門](https://jp.mathworks.com/help/signal/getting-started-with-signal-processing-toolbox.html)
MATLABのドキュメントで信号処理チュートリアルや使用例へのリンクが集まってるページ
- [Signal Processing Toolbox 関数](https://jp.mathworks.com/help/signal/functionlist.html)
MATLABの信号処理に利用する関数へのリンク集．
自分で実装する前にここにMATLAB標準の実装が存在しないか見ておいたほうがいいかもしれない．
  - [fft](https://jp.mathworks.com/help/matlab/ref/fft.html)
  - [ifft](https://jp.mathworks.com/help/matlab/ref/ifft.html)
  - [spectrogram](https://jp.mathworks.com/help/signal/ref/spectrogram.html)
  - [ウィンドウ](https://jp.mathworks.com/help/signal/ug/windows.html)
  MATLAB標準で実装されている窓関数．
    - [hann](https://jp.mathworks.com/help/signal/ref/hann.html)
    列ベクトルに対してかけるので注意
- [Signal Processing Toolbox の例](https://jp.mathworks.com/help/signal/examples.html#buoqcgw-1)
信号の可視化だとか平滑化だとかピーク解析に類似度に様々なデジタル変換やスペクトル解析などといった使えそうな例へのリンク集
- [スペクトル解析](https://jp.mathworks.com/help/signal/spectral-analysis.html)
- [測定と特性抽出](https://jp.mathworks.com/help/signal/measurements-and-feature-extraction.html)
- [実践に即したデジタル フィルター処理の紹介](https://jp.mathworks.com/help/signal/examples/practical-introduction-to-digital-filtering.html)
- [実践に即した周波数領域解析の紹介](https://jp.mathworks.com/help/signal/examples/practical-introduction-to-frequency-domain-analysis_ja_JP.html)
fftやifftを利用している．周期性の検出やパワーなどの測定など
- [audiowrite](https://jp.mathworks.com/help/matlab/ref/audiowrite.html)
- [findpeaks](https://jp.mathworks.com/help/signal/ref/findpeaks.html)
- [ピーク解析](https://jp.mathworks.com/help/signal/ug/peak-analysis.html)
findpeaksの使い方含めてピーク解析の仕方．
- [angle](https://jp.mathworks.com/help/matlab/ref/angle.html)
複素数の位相角を求める関数．
- [論理演算](https://jp.mathworks.com/help/matlab/logical-operations.html)
MATLABでの論理演算について．
- [集合演算](https://jp.mathworks.com/help/matlab/set-operations.html)
MATLABでの集合演算について．
- [imagesc](https://jp.mathworks.com/help/matlab/ref/imagesc.html)
色をプロットするようなやつ．


###MATLABを実際に利用してる例のようなもの
- [サウンド処理のプログラミング](http://nis-ei.eng.hokudai.ac.jp/~aoki/laboratory04.html)
MATLABを利用して音の生成，音の周波数分析，エフェクト，フィルタ，再生速度変更などについて．
周波数分析のコードとかハニング窓のコードとか載っている．
- [1日目(5,6時限) MATLABの使い方と音入門](http://media.sys.wakayama-u.ac.jp/kawahara-lab/LOCAL/diss/diss5/ex1_56.htm)
MATLABのごく基本的な使い方．
MATLABでの音の作成とグラフへの表示，音の保存などまで．
- [オシロスコープと信号処理[信号処理編]テキスト](http://www.ns.kogakuin.ac.jp/~ct13050/johogaku/2-2.signal_processing.pdf)
4ページ目にMATLABのfftの仕様について触れられている．
「MATLAB関数fftは正規化係数を1としており、fftの結果から振幅を求めるには標本数Nで割る必要がある（MATLAB_sample.zipのplotspec.mは引数の音声信号をy、標本数をNとするとき、fft(y)ではなくfft(y)/Nを返す仕様としている）」
- [6 フーリエ変換](http://www.slp.k.hosei.ac.jp/~itou/lecture/2011/DigitalData/04_text.pdf)
MATLABでfftを利用したプログラムについて書かれてる．
- [信号処理 1](http://media.sys.wakayama-u.ac.jp/kawahara-lab/LOCAL/diss/diss7/S3_2.htm)
STFT,窓関数について，スペクトログラムについて


###基礎知識とか必要になりそうなこと雑多
- [波の合成と分解](http://www.structure.jp/column36/column36_3.html)
フーリエ解析とか．スペクトル分解とか．パワースペクトルとか．
- [スペクトル解析](http://climbsd.lowtem.hokudai.ac.jp/group/shigeru/tc/dataan2012/num5.pdf)
フーリエ解析やスペクトル解析あたり．わかりやすい．
パワースペクトルについての説明や，離散でのフーリエ変換の話とか．
ナイキスト周波数についても触れられている．
FFTを利用したスペクトル解析の点純も書かれている．窓関数の話とか．
- [スペクトル](http://www.asp.c.dendai.ac.jp/courses/basic/kihon_spectrum01.pdf)
フーリエ解析の結果の複素数について．  
振幅スペクトル：  絶対値 ¦Ｆ(ω)¦  →  周波数ωの正弦波の大きさを表す．  
位相スペクトル：  偏角 arg(Ｆ(ω))  →  周波数ωの正弦波の位相を表す．  
- [パワースペクトルとは何ですか？](https://www.onosokki.co.jp/HP-WK/c_support/faq/fft_common/fft_spectrum_6.htm)
- [倍音](https://ja.wikipedia.org/wiki/%E5%80%8D%E9%9F%B3)
ウィキペディア．楽音とか噪音とかについても書かれている．
- [高速フーリエ変換 (FFT)](https://jp.mathworks.com/help/matlab/math/fast-fourier-transform-fft.html)
MATLABのドキュメントのFFTに関するページ
- [ＦＦＴを使って異なるサンプリング周波数での周波数強度について](http://oshiete.goo.ne.jp/qa/3008401.html)
FFTのサンプル点数とか．
- [離散フーリエ変換](https://jp.mathworks.com/help/signal/ug/discrete-fourier-transform.html)
- [6. 離散フーリエ変換 ](http://www.ic.is.tohoku.ac.jp/~swk/lecture/yaruodsp/dft.html)
やる夫で学ぶディジタル信号処理シリーズ．
東北大のウェブサイトみたいなので中身はまとも．
- [Javaで周波数分析をしてみる](http://krr.blog.shinobi.jp/javafx_praxis/java%E3%81%A7%E5%91%A8%E6%B3%A2%E6%95%B0%E5%88%86%E6%9E%90%E3%82%92%E3%81%97%E3%81%A6%E3%81%BF%E3%82%8B)
離散フーリエ変換・逆離散フーリエ変換などについて．Javaのコードも載っている．
- [フーリエ変換，逆変換をして元の波形に戻るか？](http://www.me.cs.scitec.kobe-u.ac.jp/~takigu/jugyou/shingou/0210/ensyuu/Fourier.pdf)
- [Pythonで短時間フーリエ変換（STFT）と逆変換](http://yukara-13.hatenablog.com/entry/2013/11/17/210204)
自分がstftとistftを実装するときに参考にした．
- [フーリエ逆変換を用いたローパスフィルタ（Player10）](http://www.kuma-de.com/blog/2008-09-01/84)
- [FFT フィルタ](http://blog.hulinks.co.jp/2010/12/flexpro-fft-filter.html)
FFTをかけてから特定周波数成分を消してIFFTしている．
- [FFT の負の周波数とは!?!?! の巻](http://www.bsddiary.net/d/20090508.html)
FFTの帰ってくる複素数の部分の話．
- [F離散フーリエ変換（DFT)](http://laputa.cs.shinshu-u.ac.jp/~yizawa/InfSys1/basic/chap6/index.htm)
複素平面上での回転運動成分の重ね合わせ．
- [FFTとは？　～本当は正しくないFFTの周波数特性～](http://nabe.blog.abk.nu/whats-fft)
FFTの結果は割りと信用にならないというお話．
FFTの結果はの結果をまるっきり信用したアルゴリズムを考えていると痛い目にあう．
- [【python】自己相関関数を用いたピッチ検出【サウンドプログラミング】](http://ism1000ch.hatenablog.com/entry/2014/08/27/015052)
結論：MPMアルゴリズムを使ったほうがいい
- [時系列解析(1)](http://www.astrobio.k.u-tokyo.ac.jp/tajika/class/kiso2/fourier1.pdf)
これは役に立ちそうな資料．
自己相関関数とか．
最後にMEMについて紹介がある．
- [C++で超シンプルなFFTの実装 ](http://geisterchor.blogspot.jp/2015/05/cfft.html)
余計な最適化とかを一切排したシンプルなFFT
- [NMFで音源分離を試してみる ](http://r9y9.github.io/blog/2014/10/19/nmf-music-source-separation/)
- [調波打楽器音分離（HPSS）を試す ](http://r9y9.github.io/blog/2013/09/14/hpss/)
- [スペクトルの時間変化に基づく音楽音響信号からの歌声成分の強調と抑圧](http://ci.nii.ac.jp/naid/110007997346)
上で紹介されている論文．
