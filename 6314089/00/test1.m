%ベクトルや行列について
%行方向に要素を並べるにはスペースかコンマ区切り
a0 = [1 2 3 4]
a1 = [1,2,3,4]

%列方向に要素を並べるにはセミコロン区切り
a3 = [1;2;3;4]

%行列の定義
X0 = [1 2 3; 4 5 6; 7 8 9]


%行列を作る関数がデフォルトで色々用意されている
%http://jp.mathworks.com/help/matlab/elementary-matrices-and-arrays.html

%単位行列
I0 = eye
I1 = eye(3)
I2 = eye(3, 5)
I3 = eye([4, 6])

%等間隔なベクトル
y0 = linspace(-5, 5)
y1 = linspace(-5, 5, 7)

%要素が全部1の行列
X1 = ones
X2 = ones(4)
X3 = ones(4, 3)
X4 = ones([2, 5])

%要素が全部0の行列
X5 = zeros
X6 = zeros(4)
X7 = zeros(4, 3)
X8 = zeros([2, 5])


%行列の演算

%各要素に10足す
X0 + 10

%各要素に1変数関数を実行する
sin(X0)

%行列を転地する
X0'

%逆行列を求める
inv(X0)

%行列の積
P = X0 * inv(X0)

%行列の各要素ごとの積
P = X0 .* X0


%行列の連結
A0 = [X0, X0]
A1 = [X0; X0]
A2 = [X0, X0; X0, X0]
A3 = [X0, X0; zeros(2,6)]


%行列の要素へのアクセス
A3(3,4)

B = eye(3)
%test = B(4,3)
B(4,3) = 10

%添字のベクトルでアクセスするとその添字の部分の行列を返す
A3([2,1],[1,3,4])

%コロン演算子
x0 = 1:10
x1 = 1:10:70

A3(3,:)
A3([1,3],2:5)


%その他行列や配列については以下を参照
%http://jp.mathworks.com/help/matlab/matrices-and-arrays.html