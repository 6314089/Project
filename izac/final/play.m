[data, Fs] = audioread('8bit.wav');
x=4410;%����4410�Ŏ���
vol=vol_quantize(data,x);%6314089-04���Q�l�ɂ���
[pks,locs]=findpeaks(vol,'MinPeakHeight',0.01);
%���̃s�[�N�̎��Ԃ̂Ƃ�������s���Ă���炵��
%�N���������@�m���Ă�������ǂ��Ăق���


data=mono(data);

%for vol_time=1:numel(pks)
%end

%���̉����̏ꍇ
%locs(1,1)�ł��̉������̂Ƃ�
%locs(1,10)�ł��̉����܂ނƂ�
z=locs(1,10);%(1,a)��a��a�Ԗڂ̉�(�����A���ꂼ��̉��̖�n�߂̉������Ă���Ȃ�)
data1=data(z*x:(z+5)*x,1); %5�͓K�؂Ȑ����ǂ̂��炢�͈̔͂Ŕ��肷�邩(�����Ȃ��Ă���͈͂Ɠ����ɂȂ�̂��D�܂���)

[input1,Fs]=audioread('1-C.wav');%�K���ȉ��������Ď����ĉ�����
input1=mono(input1);
m = length(data1); %window length
n = 2^nextpow2(m);
Y = fft(data1, n);
f = (0:n-1)*(Fs/n);

Y1=fft(input1,n);
Y00=max(abs(Y));
Y01=max(abs(Y1));


L=20;%���̃f�[�^�Ǝ��g���Ɏ኱�̌덷������̂ŏ���������(�K���Ȑ���������)
Y10=vol_quantize(abs(Y),L);
Y11=vol_quantize(abs(Y1),L);
f1=vol_quantize(f,L);

plot(f1,Y10-Y11*0.7 );%0.7��1�ɋ߂��C�Ӓ萔

o=min(Y10-Y11*0.7)%o���}�C�i�X�ɍs���߂��Ă��Ȃ��Ƃ����̉��͊܂܂��
