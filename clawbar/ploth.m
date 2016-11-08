function ploth(h)
[a,b]=size(h);
for i=1:a
    subplot(a,1,i)
    x=0:b-1;
    y=h(i,x+1);
    plot(x,y)
end
end