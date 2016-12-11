function r = pitch(w)
[a,b]=size(w);
n=5;
r=zeros(1,b);
for i=1:b
    l=[];
    [y,x] = findpeaks(w(1:(a/2),i));
    m=0;
    for j=1:length(x)
        t=max(w(1:(a/2),i))/3;
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
    v=v/m*2;
    
    P=[130.81 , 138.59 , 146.83 , 155.56 , 164.81, 87.31 , 92.5 , 98 , 103.83 , 110 , 116.54 , 123.47 ];
    %P(1)=C=do,P(10)=A=ra
    V=100;
    p=0;
    for q=1:length(P)        
        if abs(v-P(q)) < V           
             p=q;
             V=abs(v-P(q));
        end
    end
    C=0;
    for s1=1:2
        for s2=0:9
            s=strcat('temp/',num2str(s1*1000+s2*100+p),'.wav');
            if exist(s) ~= 0
                S=sample(s);
                l2=[];
                [y2,x2] = findpeaks(S(1:(length(S)/2)));
                for j=1:length(x2)
                    t=max(S)/3;
                    if S(j) > t
                        l2=[l2,x2(j)];
                    end
                    if length(l) == length(l2)
                        break
                    end
                end
                c=corrcoef(l(1:length(l2)),l2);
                if abs(c(1,2)) > C
                    C=abs(c(1,2));
                    r(i)=s1*1000+s2*100+p;
                end
            end
        end
    end
end
end