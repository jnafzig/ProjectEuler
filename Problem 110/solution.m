p = primes(100);

L = 2000;

maxa = 1;

a = 1;
i = 2;
while prod(2*a+1)<=2*L
    a(i) = maxa;
    i = i+1;
end

n = prod(p(1:numel(a)).^a)
