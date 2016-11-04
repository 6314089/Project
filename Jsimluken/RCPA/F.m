function res = F(x,epsilon)
    res = 0;
    if x > epsilon
        res = x - epsilon;
    end
    if x<-epsilon 
        res = x + epsilon;
    end
return