function [ k ] = order( n,p )
    %ORDER find smallest value of k such that mod(n^k,p)==1
    
    if gcd(n,p)==1
        k = 1; 
        prod = n;
        while prod~=1
            k = k + 1;
            prod = mod(n*prod,p);
        end
    else 
        k = NaN;
    end
end

