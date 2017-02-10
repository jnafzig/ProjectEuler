function [ d ] = sumdivisors( n )
    %DIVISORS give sum of divisors
    if isscalar(n)
        d = 1;
        i = 2;
        while i < sqrt(n)
            if mod(n,i)==0
                d = d + i + n/i;
            end
             i = i+1;
        end

        if mod(n,sqrt(n))==0 && n~=1
            d = d+sqrt(n);
        end
    else
%         d = arrayfun(@sumdivisors,n);

        d = ones(size(n));
        i = 2;
        while i < sqrt(max(n))
            mask = (i < sqrt(n));
            mask(mask) = (mod(n(mask),i) == 0);
            d(mask) = d(mask) + i + n(mask)/i;
            i = i+1;
        end

        mask = mod(n,sqrt(n))==0 & n~=1;
        d(mask) = d(mask)+sqrt(n(mask));
        
    end
end

