function plotw(w)
[a,b]=size(w);
for i=1:b
    subplot(b,1,i)
    x=0:1:100;
    y=w(x+1,i);
    plot(x,y)
end
end