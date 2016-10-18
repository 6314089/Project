#二つのスペクトルの類似度の評価
[前回](/Jsimluken/separate_ways/)求めた二つの
スペクトルが元のスペクトルとどれくらい一致しているかを確認してみた。
今後atmSeparaterで総当たりで検索するとき最も一致している組を見つけるのにも使う予定。
[前回](/Jsimluken/separate_ways/)の差分ファイルのみ説明する。
##実行方法
`run('sample.m');`
##evalSpectrum.m
元のやつと求めたやつの二つのスペクトルについて1インデクスについての誤差の二乗の平均を返す。
##実行結果
[前回](/Jsimluken/separate_ways/)の分離での結果。
        eval1 = 22.8077
        eval2 = 56.3178
まあまあ一致なのかも。
