function [ yn ] = isbinpalindrome( n )
    %ISPALINDROME
    
    n = dec2bin(n);
    yn = all(n(end:-1:1)==n);
    
end

