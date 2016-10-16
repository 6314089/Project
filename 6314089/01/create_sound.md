#create_sound

`create_sound`関数は単純な音を作ってくれる関数．
`create_sound.m`ファイルをMATLABの実行パスが通ったところか，現在のディレクトリに入れておく．

##`create_sound(filename, T, type1, f1, type2, f2, ...)`
`filename`は文字列．`.wav`で終わる文字列を指定する必要がある．

`T`は信号の長さを秒数で指定．

`typen`は文字列で，`sin`，`saw`，`tri`，`squ`のいずれか．
それぞれサイン波，ノコギリ波，三角波，矩形波を出してくれるはず．

`fn`は周波数．`440`とすればA4の音になるはず．

`type`と`f`のペアを追加していけば重なった音が出て来るようになってると思う．

出てくる音はサンプリングレート44100Hz（44.1kHz）固定．


使用例

    >> create_sound('A4_sin.wav', 2, 'sin', 440)
    >> create_sound('A4_saw.wav', 2, 'saw', 440)
    >> create_sound('A4_tri.wav', 2, 'tri', 440)
    >> create_sound('A4_squ.wav', 2, 'squ', 440)
    >> create_sound('F4_sin.wav', 2, 'sin', 698.4564628660)
    >> create_sound('F4_saw.wav', 2, 'saw', 698.4564628660)
    >> create_sound('F4_tri.wav', 2, 'tri', 698.4564628660)
    >> create_sound('F4_squ.wav', 2, 'squ', 698.4564628660)
    >> create_sound('A4_sin_F4_saw.wav', 2, 'sin', 440, 'squ', 698.4564628660)
    >> create_sound('A4_tri_F4_tri.wav', 2, 'tri', 440, 'tri', 698.4564628660)
    >> create_sound('A4_sin_A4_saw.wav', 2, 'sin', 440, 'saw', 440)
    >> create_sound('A4_saw_A4_squ.wav', 2, 'saw', 440, 'squ', 440)
    >> create_sound('A4_tri_A4_squ.wav', 2, 'tri', 440, 'squ', 440)
