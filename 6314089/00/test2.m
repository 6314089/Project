%関数呼び出しは他の言語と似たような感じ
A = [1 3 5];
max(A)

B = [10 6 4];
max(A, B)

maxA = max(A)

%複数の値を返す関数も作れる．
%複数の値を返すというよりも
%ベクトルを返していると言ったほうが適切なのかもしれないけれど
[maxA, location] = max(A)

%自分で宣言した関数を利用する
calc0(10, 20)

add = calc1(20, 30);
add

[add, sub, mul, div] = calc2(30, 40);
add
sub
mul
div

%別ファイルの関数を呼び出す．
%関数名とファイル名を一致させた.mファイルを用意しておく
negate(13)
negate(-32)


%ローカルな関数の宣言はファイルの最後にまとめて行う

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