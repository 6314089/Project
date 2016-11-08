
function r = pitch(w)
[a,b]=size(w);
n=5;
t=1000;
for i=1:b
    l=[];
    [y,x] = findpeaks(w(1:(a/2),i));
    m=0;
    for j=1:length(x)
        if y(j) > t
            l=[l,x(j)]
            m=m+1;
        end
        if m == n
            break
        end
    end
    v=0;
    m
    for k=1:m
        v=v+l(k)/k;
    end
    v=v/m
end

end