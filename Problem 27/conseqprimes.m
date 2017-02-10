function [ n ] = conseqprimes( a,b )
    %CONSEQPRIMES output number of consequtive primes for quadratic
    %formulas of the type n^2 + a*n + b starting with n = 0;
    n = 0;
    while n^2+a*n+b>0 && isprime(n^2+a*n+b)
        n = n+1;
    end
end

