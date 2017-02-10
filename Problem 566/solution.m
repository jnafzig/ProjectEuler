clear;

G = 0;

for c = 11:53
    tic;
    for b = 10:c-1
        for a = 9:b-1
            Flips(a,b,c)
        end
    end
    toc
    c
end
G
