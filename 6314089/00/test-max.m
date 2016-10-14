%1
v = randn(1, 20);

disp('max value in v is')
max(v)


%2
v = randn(20, 1)

disp('max value in v is')
max(v)


%3
A = [1 2 3; 4 5 6; 7 8 9]

disp('max values is')
max(A)


%4
A = [1 2 3; 4 5 6; 7 8 9]

disp('max values is')
max(A, [], 1)
max(A, [], 2)


%5
A = [1 2 3; 4 5 6; 7 8 9]
B = [3 2 1; 6 5 4; 9 8 7]

disp('max matrix is')
max(A, B)