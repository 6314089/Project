function res = congested(A,B)
    div = 10e-6;
    tmp = abs(A-B);
    error = max(max(tmp));
    if error > div
       %disp(error);
       res = false; 
    else
        disp('congested!!');
       res = true;
    end
return