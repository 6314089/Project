function [npks,varargout] = notpeaks(x)
    [pks, locs] = findpeaks(x);
    
    nlocs = setdiff(1:length(x), locs);
    n = length(nlocs);
    
    npks = zeros(1, n);
    for k = 1:n
        npks(k) = x(nlocs(k));
    end
        
    varargout{1} = nlocs;
    