function [ amicable ] = isamicable( n )
    %ISAMICABLENUMBER Check whether n is amicable

    m = sumdivisors(n);
    amicable = (m~=n) & (sumdivisors(m)==n);
    
end

