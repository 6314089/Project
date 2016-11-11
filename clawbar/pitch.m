function r = pitch(w)
[a,b]=size(w);
n=5;
t=300;
p=zeros(1,b);
for i=1:b
    l=[];
    [y,x] = findpeaks(w(1:(a/2),i));
    m=0;
    for j=1:length(x)
        if y(j) > t
            l=[l,x(j)];
            m=m+1;
        end
        if m == n
            break
        end
    end
    v=0;
    for k=1:m
        v=v+l(k)*44100/4096/4/k;
    end
    v=v/m*2
    
    P=[87.31 , 92.5 , 98 , 103.83 , 110 , 116.54 , 123.47 , 130.81 , 138.59 , 146.83 , 155.56 , 164.81];
    %P(1)=F=fa,P(5)=A=ra
    V=100;
    p(i)=0;
    for q=1:length(P)        
        if abs(v-P(q)) < V
        p(i)=q;
        V=abs(v-P(q));
    end
    end
        
end
p
end