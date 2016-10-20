function evalValue = evalSpectrum(org,src)
    evalValue = 0;
    searchWidth = size(org);
    searchWidth = floor(searchWidth(1)/2) +...
                  mod(searchWidth(1),2); %because of symmetric
    for i = 1:searchWidth
       evalValue = evalValue + (src(i)-org(i))^2;  
    end
    evalValue = evalValue / searchWidth;
    evalValue = sqrt(evalValue);
    return