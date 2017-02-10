primelist = primes(1000000);
numel(primelist)
for i = 1:6
    rotprimes = arrayfun(@rotdigits,primelist);
    primelist = rotprimes(isprime(rotprimes));
    numel(primelist)
end