function [ yn ] = ispalindrome( n )
    %ISPALINDROME
    
    n = sprintf('%d',n);
    yn = all(n(end:-1:1)==n);
    
end

