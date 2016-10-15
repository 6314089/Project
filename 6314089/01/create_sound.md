#create_sound

`create_sound`関数は単純な音を作ってくれる関数．
`create_sound.m`ファイルをMATLABの実行パスが通ったところか，現在のディレクトリに入れておく．

##`create_sound(filename, T, type, f)`
`filename`は文字列．`.wav`で終わる文字列を指定する必要がある．

`T`は信号の長さを秒数で指定．

`type`は文字列で，`sin`，`saw`，`tri`，`squ`のいずれか．
それぞれサイン波，ノコギリ波，三角波，矩形波を出してくれるはず．

`f`は周波数．`440`とすればA2の音になるはず．
