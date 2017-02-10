n = 1:10000;
m = n.*(3*n-1)/2;

[x,y] = ndgrid(m,m);

msk1 = mod(sqrt(24*abs(bsxfun(@plus,m,-m'))+1),6) == 5;
msk2 = mod(sqrt(24*bsxfun(@plus,m,m')+1),6) == 5;


diff(y(msk1&msk2))

