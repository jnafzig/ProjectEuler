function [ primenumbers ] = sieve( range )
    %SIEVE 
    sievemask = true(size(range));
    primelist = primes(int64(sqrt(double(max(range)))));
    d = range(2)-range(1);
    skip = find(primelist==d);
    if ~isempty(skip)
        primelist = [primelist(1:skip-1),primelist(skip+1:end)];
    end
    startmod = mod(range(1),primelist);
    spacingmod = mod(d,primelist);
    [~,minv,~] = gcd(spacingmod,primelist);
    startspot = mod(-minv.*startmod,primelist)+1;
    for i = 1:numel(primelist)
        sievemask(startspot(i):primelist(i):end) = false;
    end
    primenumbers = range(sievemask);
end

