#03
時間軸は考えないで，同時発声してるモノラル音源での音源分離を目指す．

##get_A
A0とその2倍音，3倍音，…の周波数を22050Hzまで並べたベクトルを返す．

`[27.5 55 82.5 110 ...]`みたいなのが返ってくる．A0は27.5Hz．A4=440Hzの2の4乗分の一．440*(1/16) = 27.5．

##A_frequencies
入力した音をfftにかけて，そのピーク部分のうちA0の倍音の成分を抽出する．

引数は音源のファイル名．key Aの音でないと意味が無いはず．

返り値は1次のベクトル．
返り値を`[y1 y2 y3 y4 ...]`とすると，`y1`は27.5Hzの部分，`y2`は55Hzの部分，`y3`は82.5Hzの部分…．

    function ret = A_frequencies(filename)
        %read file
        [input, Fs] = audioread(filename);

        %fft
        m = length(input); %window length
        n = 2^nextpow2(m);
        Y = fft(input, n);

        %get peek frequencies and length
        [~, locs] = findpeaks(abs(Y), 'MinPeakProminence', 2500);
        peekfs = (locs-1)*(Fs/n); %turn locs into "0 start" and into frequencies
        npeekfs = ceil(length(peekfs)/2);

        %get key A frequencies and length
        Afs = get_A;
        nAfs = length(Afs);

        %fill return value with 0
        ret = zeros(1, length(Afs));

        %10cents
        threshold = nthroot(2, 12*10);    


        for i = 1:nAfs
            Af = Afs(i);
            for j = 1:npeekfs
                f= peekfs(j);
                if (Af >= f && Af / f <= threshold) ||...
                    (Af < f && f / Af <= threshold) %+-10cents
                   ret(i) = Y(locs(j));
                end
            end
        end

fftの高速化のためにサンプルを2のべき乗個になるようにしてる．
[02](/6314089/02/README.md)でも同じことをやってる．  
https://jp.mathworks.com/help/matlab/math/fast-fourier-transform-fft.html

`findpeaks`でよくわからずプロミネンスとかいうのを使っているのも02と同じ．

`peekfs`は`findpeaks`で取ってきたピークの場所を周波数に変換したもの．
後半の部分は鏡像で役立たずらしいので前半の部分だけを使うために`npeeks`は`peeks`の長さを2で割って切り上げたものにしてる．

fftかけたものをfindpeaksする前に半分に切り取ったほうがいい気もしてきた．

get_Aは上で説明したとおり．

for文で，
ピークの周波数とA0の倍音周波数が一致する部分についてのみ，
fftの結果の`Y`を返り値のベクトルに入れている．
`Afs`には`get_A`の返り値として22050Hz以下のA0の倍音が順番に入っている．
`Af`はA0の倍音の一つということになる．
それと，ピークの周波数が一致するかどうかを確認し，
一致したものについては，そのfftの結果を返り血に入れている．

周波数が一致するかどうかの判定には閾値10セントとした．
±(半音の1/10)だったときは同じ音だと判定している．
半音の1/10は周波数の比が2の120乗根以内になっているかどうかを見れば良い．

人間には音の高さと周波数は等比数列的に聞こえる．
周波数が2倍になると1オクターブ上がるので，1オクターブを12等分するには，隣り合う音の周波数の比が2の12乗根になるようにする．
これが12平均律での音の決め方．

12平均律での半音の差を100セントというらしい．
±10セント以内であるかを考えるならば，周波数の比が2の120乗根倍以内になっているかどうかを考えれば良いことになる．
