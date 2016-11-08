function r = time(h)
[a,b]=size(h);
r=zeros(a,b);
t=0.13;
for i=1:a
    for k=1:b
        if h(i,k) > t
            r(i,k)=1;
        end
    end
    [y,x] = findpeaks(h(i,:));
    for j=1:length(x)
        if y(j) > t
            r(i,x(j))=2;
        end
    end       
end
end