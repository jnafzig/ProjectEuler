primelist = primes(10000);
done = false;
n = 4;
while ~done
    x = 2*n+1;
    if ~isprime(x)
        if ~any(mod(sqrt((x-primelist(primelist<x))/2),1)==0)
            done = true;
        end
    end
    n = n +1;
end

x = 2*n-1