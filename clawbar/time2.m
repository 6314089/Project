function r = time2(h)
[a,b]=size(h);
r=zeros(a,b);
for i=1:a
    t=max(h(i,:))/3;
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