[data, Fs] = audioread('8bit.wav');
x=4410;%仮に4410で試す
vol=vol_quantize(data,x);%6314089-04を参考にした
[pks,locs]=findpeaks(vol,'MinPeakHeight',0.01);
%音のピークの時間のとり方が失敗しているらしい
%誰かいい方法知っていたら改良してほしい


data=mono(data);

%for vol_time=1:numel(pks)
%end

%この音源の場合
%locs(1,1)でその音だけのとき
%locs(1,10)でその音を含むとき
z=locs(1,10);%(1,a)でaはa番目の音(もし、それぞれの音の鳴り始めの音が取れているなら)
data1=data(z*x:(z+5)*x,1); %5は適切な整数どのくらいの範囲で判定するか(音がなっている範囲と同じになるのが好ましい)

[input1,Fs]=audioread('1-C.wav');%適当な音源を入れて試して下さい
input1=mono(input1);
m = length(data1); %window length
n = 2^nextpow2(m);
Y = fft(data1, n);
f = (0:n-1)*(Fs/n);

Y1=fft(input1,n);
Y00=max(abs(Y));
Y01=max(abs(Y1));


L=20;%元のデータと周波数に若干の誤差があるので処理をする(適当な整数を入れる)
Y10=vol_quantize(abs(Y),L);
Y11=vol_quantize(abs(Y1),L);
f1=vol_quantize(f,L);

plot(f1,Y10-Y11*0.7 );%0.7は1に近い任意定数

o=min(Y10-Y11*0.7)%oがマイナスに行き過ぎていないときその音は含まれる
