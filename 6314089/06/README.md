#06
目標:HPSSを実装してみる．

##HPSSについて
###HPSSについて書かれたページ
- [turugayaさんの紹介してくれたページ](http://r9y9.github.io/blog/2013/09/14/hpss/)  
フリー音源を利用したデモもある．

###HPSSに関係する論文
- [スペクトログラムの滑らかさの異方性に基づいた. 調波音・打楽器音の分離](https://www.google.co.jp/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwj3k8rCnvPPAhUHoZQKHWEACZEQFggeMAA&url=http%3A%2F%2Fhil.t.u-tokyo.ac.jp%2Fpublications%2Fdownload.php%3Fbib%3DMiyamoto2008ASJ03_HPSep.pdf&usg=AFQjCNF1jgFa9TppMlmprkDMe1uEKaH4nQ)  
HPSSを提案している論文．
これのもう一個前の研究として二次元フィルタを利用した云々というのがあるみたいだけど．滑らかさの異方性を利用しているいわゆるHPSSはこれが元になっているのかしら．

- [スペクトルの時間変化に基づく音楽音響信号からの歌声成分の強調と抑圧](https://ipsj.ixsq.nii.ac.jp/ej/?action=pages_view_main&active_action=repository_view_main_item_detail&item_id=62626&item_no=1&page_id=13&block_id=8)  
[turugayaさんの紹介してくれたHPSSについてのページ](http://r9y9.github.io/blog/2013/09/14/hpss/)からリンクの貼られていた論文

- [スペクトログラムの滑らかさの異方性に基づく調波音・打楽器音分離の各手法の性能比較](http://www.kecl.ntt.co.jp/people/kameoka.hirokazu/publications/Tachibana2011ASJ09published.pdf)  
HPSSの中のさらに様々な手法について．

- [方位クラスタリングと非負値行列因子分解を用いた音楽信号分離較](https://library.naist.jp/mylimedio/dllimedio/showpdf2.cgi/DLPDFR009675_P1-57)  
HPSSとNMFを複合的に利用して音源分離する手法？

- [スペクトログラムの長距離滑らかさを考慮した 調波打楽器音分](https://www.google.co.jp/url?sa=t&rct=j&q=&esrc=s&source=web&cd=5&cad=rja&uact=8&ved=0ahUKEwiF8dmPnfPPAhUGHJQKHaNxDTwQFgg6MAQ&url=https%3A%2F%2Fipsj.ixsq.nii.ac.jp%2Fej%2Findex.php%3Faction%3Dpages_view_main%26active_action%3Drepository_action_common_download%26item_id%3D91817%26item_no%3D1%26attribute_id%3D1%26file_no%3D1%26page_id%3D13%26block_id%3D8&usg=AFQjCNFk0b8s3Yy0P9BKwcMwMQPL8iGL3Q)  
HPSSをより精度良くすると言う趣旨の論文だけど，基本のHPSSについての説明もわかりやすい．

- [音楽音響信号に対する歌声・伴奏音・打楽器音分離に基づくコード認識](http://sap.ist.i.kyoto-u.ac.jp/members/yoshii/papers/sigmus-2015-maruo.pdf)  
HPSSを利用したコード認識など．

HPSSと言うのは様々な音声解析に利用されているようだ．

- [音楽音響信号の実時間 加工技術 - 情報処理学会電子図書館](https://www.google.co.jp/url?sa=t&rct=j&q=&esrc=s&source=web&cd=5&cad=rja&uact=8&ved=0ahUKEwjwlZjxzPfPAhWBfrwKHVMfCsUQFgg6MAQ&url=https%3A%2F%2Fipsj.ixsq.nii.ac.jp%2Fej%2Findex.php%3Faction%3Dpages_view_main%26active_action%3Drepository_action_common_download%26item_id%3D60831%26item_no%3D1%26attribute_id%3D1%26file_no%3D1%26page_id%3D13%26block_id%3D8&usg=AFQjCNEheE8sauKV5qyXgpZZASUZaVJ5QQ)  
HPSSについても触れられている．

##スペクトログラムを描画してみる
とりあえず論文で言われているような性質（調波成分・打楽器成分の異方性）が
本当にあるのか見るために，用意した楽曲に対してスペクトログラムを描いてみる．

`test_spectrogram.m`を実行すると用意した楽曲のスペクトログラムと，用意した各パートのスペクトログラムが表示される．
スペクトログラムは表示にあたって，見やすくするためにスペクトルの絶対値の0.3乗を利用している．

###全パート
![all](/6314089/06/img/all.png)
これが全パートでのスペクトログラム．

###バイオリン
![strings](/6314089/06/img/strings.png)
これがバイオリンのパートだけでのスペクトログラム．
横方向に連続していて縦方向には飛び飛びである．

音の鳴り始めは縦方向になめらかな部分も含んでいるので全体的に格子状な感じである．
HPSSを行うと，このバイオリンに含まれている縦方向になめらかな成分は
分離されることになるはず．
バイオリンのような非打楽器であっても，
音の立ち上がりの部分では打楽器に似たような特性があるということかしら．

ビブラート的なもののせいなのか，縦方向にも地味に幅がある．

###ドラム
![drums](/6314089/06/img/drums.png)
これがドラムパートのスペクトログラム．
一応縦方向に長いということだけれども．ちょっと微妙な気もする．

###ピアノ
![piano](/6314089/06/img/piano.png)
ピアノパートのスペクトログラムである．
和音を鳴らしているため，割りとたくさんの周波数にわたって検出されている．
ピアノの音でも刻むような演奏の部分とかは縦方向に連続な値が検出されるものなのかもしれないが．横方向への滑らかさと縦方向の滑らかさの差というのはこの図を見ても余りはっきりしないような．なかなか微妙なところだ．


とりあえずこの適当な楽曲をモデル音源としてHPSSを行ってみることにする．果たしてうまくいくだろうか．
