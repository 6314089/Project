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
