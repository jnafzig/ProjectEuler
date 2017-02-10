p = primes(100);

n=prod(p(1:7).^[2,2,1,1,1,1,0]);

n2 = n^2;
d = 1;
i = 2;
while i <= n
    if mod(n2,i)==0
        d = d + 1;
    end
     i = i+1;
end
d