#wavelet_transform
 連続ウェーブレット変換では、サンプル数が行列の行数に対応するので、行列サイズが巨大になる。それの対策のために、何個目のサンプルから、何個目のサンプルまでを変換するか指定できるようにしてある
英語で書いてあるコメントは参照しちゃダメ。コピペのときに消し忘れただけ。  

 [wavelet_base.m](kurezoul/wavelet_taransform/wavelet_base.m)  
 ここから変換をする。それ以外には触らない方が無難。  
 変数の説明(6つ目以降は使用しない。拡張オプション？)  
 *mode:1が連続ウェーブレット変換モード、。2が逆変換モード。  
 *data_spec:modeが1のときに音響信号データ、modeが2のときにウェーブレット変換後のスペクトログラムデータ  
 *fs:フレームレート  
 *start en:変換の開始点(start)、終了点(en)  

 以下備考欄  
 *dt:サンプル間の時間  
 *dj:各スケール間の指定(cent単位)  
 *oct:取りたいオクターブ数  
 *init:初期周波数  
 *mother:マザーウェーブレット  

 [wavelet_cwt.m](kurezoul/wavelet_taransform/wavelet_cwt.m)  
 連続ウェーブレット変換の本体部。  

 [wavelet_icwt.m](kurezoul/wavelet_taransform/wavelet_icwt.m)  
 連続ウェーブレット逆変換の本体部。計算方法がかなり怪しい。  

 [wave_bases.m](kurezoul/wavelet_taransform/wavelet_bases.m)  
 マザーウェーブレットの周波数応答の計算部。(サンプルプログラムそのまま)  

 [test2.m](kurezoul/wavelet_taransform/test2.m)  
 7行目までがスペクトログラムの作成と音響データの再構成。それ以下は元データと再構成デートの比較  

#参考リンク
-[FFTを使った高速ウェーブレット変換](http://r9y9.github.io/blog/2013/10/20/continuous-wavelet-tranform/)  
 そもそもこれが参考リンク集みたいなページ。ウェーブレット変換の高速化。  
-[逆連続ウェーブレット変換](http://r9y9.github.io/blog/2013/10/21/signal-reconstruction-using-invere-cwt/)  
 スケールの取り方の参考にした。  
-[FFTを用いたウェーブレット変換(英語)](http://paos.colorado.edu/research/wavelets/) 
 ウェーブレット変換の高速化についてはここで学べるはず。読んでないけど。  
-[上サイトのサンプルプログラム](http://paos.colorado.edu/research/wavelets/software.html)  
 8，9割はここのプログラムのコピペ。上のところを読まなくても、ここのプログラムの解析をするだけでいいかな。
