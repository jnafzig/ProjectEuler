maxorder = 1;
maxp = 1;

for p = 2:1000
    ord = order(10,p);
    if ord~=Inf && ord>maxorder
        maxorder = ord;
        maxp = p;
    end
end
maxp