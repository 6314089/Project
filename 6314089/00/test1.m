%�x�N�g����s��ɂ���
%�s�����ɗv�f����ׂ�ɂ̓X�y�[�X���R���}��؂�
a0 = [1 2 3 4]
a1 = [1,2,3,4]

%������ɗv�f����ׂ�ɂ̓Z�~�R������؂�
a3 = [1;2;3;4]

%�s��̒�`
X0 = [1 2 3; 4 5 6; 7 8 9]


%�s������֐����f�t�H���g�ŐF�X�p�ӂ���Ă���
%http://jp.mathworks.com/help/matlab/elementary-matrices-and-arrays.html

%�P�ʍs��
I0 = eye
I1 = eye(3)
I2 = eye(3, 5)
I3 = eye([4, 6])

%���Ԋu�ȃx�N�g��
y0 = linspace(-5, 5)
y1 = linspace(-5, 5, 7)

%�v�f���S��1�̍s��
X1 = ones
X2 = ones(4)
X3 = ones(4, 3)
X4 = ones([2, 5])

%�v�f���S��0�̍s��
X5 = zeros
X6 = zeros(4)
X7 = zeros(4, 3)
X8 = zeros([2, 5])


%�s��̉��Z

%�e�v�f��10����
X0 + 10

%�e�v�f��1�ϐ��֐������s����
sin(X0)

%�s���]�n����
X0'

%�t�s������߂�
inv(X0)

%�s��̐�
P = X0 * inv(X0)

%�s��̊e�v�f���Ƃ̐�
P = X0 .* X0


%�s��̘A��
A0 = [X0, X0]
A1 = [X0; X0]
A2 = [X0, X0; X0, X0]
A3 = [X0, X0; zeros(2,6)]


%�s��̗v�f�ւ̃A�N�Z�X
A3(3,4)

B = eye(3)
%test = B(4,3)
B(4,3) = 10

%�Y���̃x�N�g���ŃA�N�Z�X����Ƃ��̓Y���̕����̍s���Ԃ�
A3([2,1],[1,3,4])

%�R�������Z�q
x0 = 1:10
x1 = 1:10:70

A3(3,:)
A3([1,3],2:5)


%���̑��s���z��ɂ��Ă͈ȉ����Q��
%http://jp.mathworks.com/help/matlab/matrices-and-arrays.html