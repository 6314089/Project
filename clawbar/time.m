function r = time(h)
[a,b]=size(h);
r=zeros(a,b);
for i=1:a
    t=max(h(i,:))/2;
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
        if (y(j) > t) && (x(j)<b) && r(i,x(j)+1)==0
            r(i,x(j))=0;
        end
    end       
end
end