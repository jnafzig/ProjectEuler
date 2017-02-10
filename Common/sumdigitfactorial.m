function [ d ] = sumdigitfactorial( n)

    if isscalar(n)
        Ndigits = floor(log10(n))+1;
        d = 0;
        for i = 1:Ndigits
            R = mod(n,10);
            d = d + factorial(R);
            n = (n - R)/10;
        end
    else
        d = arrayfun(@(x) sumdigitfactorial(x),n);
    end
end 

