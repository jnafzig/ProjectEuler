p = primes(7654321);
i = numel(p);
while ~ispandigital(p(i))
    i = i -1;
end
