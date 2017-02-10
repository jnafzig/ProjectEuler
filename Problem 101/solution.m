p = [1 -1 1 -1 1 -1 1 -1 1 -1 1];

x = 0:10;
seq = polyval(p,x);

for N = 0:3

    pf = polyfit(x(1:N+1),seq(1:N+1),N);
    
    [polyval(pf,N),polyval(p,N)]
    
end