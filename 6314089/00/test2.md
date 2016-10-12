#test2.m
##関数呼び出しについて
関数呼び出しは他の言語と似たような感じ．
与える引数の数によって働きが違うものがある．

    A = [1 3 5];
    max(A)

    B = [10 6 4];
    max(A, B)

    maxA = max(A)


複数の値を返す関数も作れる．複数の値を返すというよりも
ベクトルを返していると言ったほうが適切なのかもしれないけれど．

    [maxA, location] = max(A)

##関数の宣言
関数の宣言はファイルの最後に行う．

    %返り値のない関数の宣言
    function calc0(a, b)
        add = a + b
    end

    %返り値が1つの関数の宣言
    function add = calc1(a, b)
        add = a + b;
    end

    %返り値が複数の関数の宣言
    function [add, sub, mul, div] = calc2(a, b)
        add = a + b;
        sub = a - b;
        mul = a * b;
        div = a / b;
    end

`function 返り値 = 関数名(引数1, 引数2, ...)`の形式で宣言する．
返り値がないときは`function [] = 関数名(引数1, 引数2, ...)`か，`function 関数名(引数1, 引数2, ...)`の形を利用する．

関数を複数定義するなどして境界が曖昧ならば`end`をつける．
1ファイルに1つしか関数を宣言しない場合などは`end`が無くてもOK．

自分で宣言した関数も普通の関数と同じように利用できる．
複数値を返す関数の返り値の受け取り方に注意．
Destructuringみたいなかたち．

    calc0(10, 20)

    add = calc1(20, 30);
    add

    [add, sub, mul, div] = calc2(30, 40);
    add
    sub
    mul
    div

別ファイルの関数を呼び出すには，関数名とファイル名を一致させた.mファイルを用意しておく．用意したファイルはMATLABのパスが通るところか，現在のディレクトリにおいておく．

今回はnegate.mにnegate関数を用意したので，以下のようにしてnegate関数が利用できる．

    negate(13)
    negate(-32)


negate.mの中身

    function result = negate (a)
        result = - abs(a);
