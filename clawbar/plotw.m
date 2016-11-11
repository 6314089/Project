function plotw(w,n)
[a,b]=size(w);
for i=1:b
    subplot(b,1,i)
    x=0:1:n;
    y=w(x+1,i);
    plot(x,y)
end
end