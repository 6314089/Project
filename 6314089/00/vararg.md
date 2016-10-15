#vararginとvarargoutについて

##セル配列について
https://jp.mathworks.com/help/matlab/cell-arrays.html

セル配列とはなんでも入る配列みたいなもん？
Object型のリストみたいな．

要素には`{}`でアクセスするみたい．
普通の配列のアクセスは`()`だったけど．


##vararginについて
https://jp.mathworks.com/help/matlab/ref/varargin.html

可変長引数を受け取れる．
javaで言う可変引数`戻り値型 func(型... args)`みたいな？

普通の引数の後に与えた引数は`varargin`で受け取る．

`varargin`はなんでも入るセル配列というものになっているみたい．
Javaの配列で可変長引数を受け取るのとは違ってデータ型は何でもありのようだ．


    function varlist(X, Y, varargin)
        fprintf('Total number of inputs = %d\n',nargin);

        nVarargs = length(varargin);
        fprintf('Inputs in varargin(%d):\n',nVarargs)
        for k = 1:nVarargs
            fprintf('   %d\n', varargin{k})
        end

`nargin`と言うのは普通の引数とか変の引数の両方を合わせた全体の引数の数が渡されるよう．

`varargin`の長さを調べてその長さだけ`for`文で回している．

出力結果

    >> varlist(10, 20, 30, 40, 50, 60)
    Total number of inputs = 6
    Inputs in varargin(4):
       30
       40
       50
       60


MATLABの関数には関数のオーバーロードは存在しない．

オーバーロードされた関数のようなものを作りたいときは，`varargin`で対応する必要がある．


##varargoutについて
http://jp.mathworks.com/help/matlab/ref/varargout.html

戻り値を可変長にするやつ．`varargin`と似ている．

    function [npks,varargout] = notpeaks(x)
        [pks, locs] = findpeaks(x);

        nlocs = setdiff(1:length(x), locs);
        n = length(nlocs);

        npks = zeros(1, n);
        for k = 1:n
            npks(k) = x(nlocs(k));
        end

        varargout{1} = nlocs;

ピークではない部分を取り出すものを作った．
`setdiff`は差集合を撮るもの．
`x`の添字のうち`locs`に含まれないものを持ってきて，それを`nlocs`に．
`nlocs`に対応する`x`の値を`npks`にしている．

出力結果

    >> x = [1 1 1 1 3 1 1 1 1 5 2 2 2 2 4 2 2 2 3 7 3 0 0 0 9]

    x =

      1 列から 14 列

         1     1     1     1     3     1     1     1     1     5     2     2     2     2

      15 列から 25 列

         4     2     2     2     3     7     3     0     0     0     9

    >> [pks, locs] = findpeaks(x)

    pks =

         3     5     4     7


    locs =

         5    10    15    20

    >> [npks, nlocs] = notpeaks(x)

    npks =

      1 列から 14 列

         1     1     1     1     1     1     1     1     2     2     2     2     2     2

      15 列から 21 列

         2     3     3     0     0     0     9


    nlocs =

      1 列から 14 列

         1     2     3     4     6     7     8     9    11    12    13    14    16    17

      15 列から 21 列

        18    19    21    22    23    24    25


    >> npks = notpeaks(x)

    npks =

      1 列から 14 列

         1     1     1     1     1     1     1     1     2     2     2     2     2     2

      15 列から 21 列

         2     3     3     0     0     0     9

出力引数1つと2つで動いているね．
