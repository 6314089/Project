%�֐��Ăяo���͑��̌���Ǝ����悤�Ȋ���
A = [1 3 5];
max(A)

B = [10 6 4];
max(A, B)

maxA = max(A)

%�����̒l��Ԃ��֐�������D
%�����̒l��Ԃ��Ƃ�������
%�x�N�g����Ԃ��Ă���ƌ������ق����K�؂Ȃ̂�������Ȃ������
[maxA, location] = max(A)

%�����Ő錾�����֐��𗘗p����
calc0(10, 20)

add = calc1(20, 30);
add

[add, sub, mul, div] = calc2(30, 40);
add
sub
mul
div

%�ʃt�@�C���̊֐����Ăяo���D
%�֐����ƃt�@�C��������v������.m�t�@�C����p�ӂ��Ă���
negate(13)
negate(-32)


%���[�J���Ȋ֐��̐錾�̓t�@�C���̍Ō�ɂ܂Ƃ߂čs��

%�Ԃ�l�̂Ȃ��֐��̐錾
function calc0(a, b)
    add = a + b
end

%�Ԃ�l��1�̊֐��̐錾
function add = calc1(a, b)
    add = a + b;
end

%�Ԃ�l�������̊֐��̐錾
function [add, sub, mul, div] = calc2(a, b)
    add = a + b;
    sub = a - b;
    mul = a * b;
    div = a / b;
end