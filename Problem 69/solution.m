n = 2:1000000;
ratio = n./arrayfun(@eulertotient,n);
[rat,ix] = max(ratio);
n(ix)