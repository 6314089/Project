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
        v=v+l(k)*44100/8192/k;
    end
    v=v/m*2
    
    P=[87.31 , 98 , 110 , 123.47 , 130.81 , 146.83 , 164.81];
    
    V=abs(v-P(3));
    p(i)=1;%A=ra
    if abs(v-P(4)) < V
        p(i)=2;%B=si
        V=abs(v-P(4));
    end
    if abs(v-P(5)) < V
        p(i)=3;%C=do
        V=abs(v-P(5));
    end %
    if abs(v-P(6)) < V
        p(i)=4;%D=re
        V=abs(v-P(6));
    end    
    if abs(v-P(7)) < V
        p(i)=5;%E=mi
        V=abs(v-P(7));
    end
    if abs(v-P(1)) < V
        p(i)=6;%F=fa
        V=abs(v-P(1));
    end  
    if abs(v-P(2)) < V
        p(i)=7;%G=so
        V=abs(v-P(2));
    end        
    
end
p
end