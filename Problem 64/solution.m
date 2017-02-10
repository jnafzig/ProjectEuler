count = 0;
for s = 1:10000
    m = 0;
    d = 1;
    a0 = floor(sqrt(s));
    if a0 ~=sqrt(s)
        a = a0;
        n = 0;
        while a~=2*a0
            m = d*a-m;
            d = (s - m^2)/d;
            a = floor((a0+m)/d);
            n = n+1;
        end
        if mod(n,2)==1
            count = count + 1;
        end
    end
end
count