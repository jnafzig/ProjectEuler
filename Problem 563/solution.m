
N = 1e8;
tic;
mlist = sort(mvals(N));
toc;

Nm = 0;
Alist = cell(numel(mlist),1);
i = 1;
tic;
for m = mlist
    k = find(mlist>=m & mlist<=1.1*m);
    Alist{i} = m*mlist(k);
    i = i + 1;
end
toc;
Alist = sort([Alist{:}]);

M = zeros(100,1);
done = false(100,1);
i = 1;
n = 2;
tic;
while i <= numel(Alist)
    j = i + 1;
    A = Alist(i);
    while j <= numel(Alist) && Alist(j)==A
        j = j + 1;
    end
    
    if j-i<=100 && ~done(j-i)
        M(j-i) = Alist(i);
        done(j-i) = true;
    end
    
    i = j;
end
toc;
