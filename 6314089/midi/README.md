# MIDI

midiのファイルと，@kamakura氏と@izac氏から渡されるデータのフォーマットを 揃える必要がある．

揃えるフォーマットは，とりあえず以下の通りにする．

各トラックの各音程ごとに配列を用意する． 配列の要素数はサンプル数とする． つまり(楽曲の再生時間秒数*44100)個の要素を持つ配列とする．

ドラムに関してはなったタイミングだけ1になっていて他は0とする．

ドラム以外の楽器に関しては，鳴り始めを2，鳴っている間を1，鳴っていないところは0とする．

やたらと配列が長くなる上に同じ数字がずっと続くので， なにか別のフォーマットにした方がいいかもしれない．

どのようにして制度の比較をするかに合わせてフォーマットを考えるべきか．

## 参考

- [JavaScriptでMIDIファイルを解析してみる ２](http://qiita.com/PianoScoreJP/items/71db2907b302793544e9)

## 使用ライブラリ

- [nfroidure/MIDIFile](https://github.com/nfroidure/MIDIFile)

このライブラリでmidiファイルのイベントのデータを格納した オブジェクトの配列を得ることが出来る．

オブジェクトの配列の一例は以下の通り．

test.midを読み込んだもので，`node ./test.js`とすると出力される． 四分の四拍子の一生節分のmidiデータで， 1拍目と3拍目に4分音符でC4の音を鳴らしている．

```
[ { index: '0x6f',
    delta: 0,
    type: 8,
    subtype: 9,
    channel: 0,
    param1: 60,
    param2: 100,
    playTime: 0,
    track: 2 },
  { index: '0x73',
    delta: 480,
    type: 8,
    subtype: 8,
    channel: 0,
    param1: 60,
    param2: 0,
    playTime: 500.00000000000006,
    track: 2 },
  { index: '0x78',
    delta: 480,
    type: 8,
    subtype: 9,
    channel: 0,
    param1: 60,
    param2: 100,
    playTime: 1000.0000000000001,
    track: 2 },
  { index: '0x7d',
    delta: 480,
    type: 8,
    subtype: 8,
    channel: 0,
    param1: 60,
    param2: 0,
    playTime: 1500.0000000000002,
    track: 2 } ]
```

deltaが前のイベントからの時間になっている． ただし，単位はsでもmsでもない． 四分音符一つの長さを480とした時の長さになっている． この480というのはヘッダとかで定義されているので， ファイルによっては別の値になっていることもあるらしい面倒くさいね．

typeってのは良く分からない． typeが8なのがmidiイベントだろうかと推測しているが． 今回はmidiファイルのイベントの中でも，midiイベントを見たい． メタイベントなどは今回の用途には必要ない？ なので基本的にtypeが8のやつを見ればいいのかな．

subtypeは8だとNOTE_OFF，9だとNOTE_ONのイベントになってる．

param1が音高に当たる． C-1からG9までが0から127の値で保持されている． 60だとC4の音ということになる．

param2がベロシティ．NOTE_OFFのときは0になる．

playTimeがこのイベントの発生時刻をミリ秒で返してくれているみたい． これはmidiの中にある仕様ではなくて，このライブラリが用意してくれているものみたい． これを利用することにして，ややこしいdeltaは使わないことにする． 今回はテンポは120なので4分音符が秒間2回のペースである． 0ミリ秒でなり始めた音が500ミリ秒で止まっているのは， 4分音符一個鳴らしたというのとちょうど対応しているね．