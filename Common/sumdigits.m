function [ d ] = sumdigits( n, p )
    if nargin <2
        p = 1;
    end
%     if isscalar(n)
%         Ndigits = floor(log10(n))+1;
%         d = 0;
%         for i = 1:Ndigits
%             R = mod(n,10);
%             d = d + R^p;
%             n = (n - R)/10;
%         end
%     else
%         d = arrayfun(@(x) sumdigits(x,p),n);
%     end
    d = zeros(size(n));
    while ~all(n==0)
        d = d + mod(n,10).^p;
        n = fix(n/10);
    end
end 


