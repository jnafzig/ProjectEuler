%  cx/xd
list = [];
for x = 1:9
    for c = 1:x
        for d = c+1:9
            if (10*c+x)/(10*x+d)==c/d
                list = [list;[c,x,d]];
            end
        end
    end
end