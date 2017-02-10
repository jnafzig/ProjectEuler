plist = primes(10^4)';
plist = num2str(plist(plist>=1e3));

for p = (plist)'
    
    permutations = str2num(unique(perms(p'),'rows'));
    primeperms = (permutations(isprime(permutations)&permutations>1e3,:));
    
    pcheck = str2num(p');
    [i,j]=find(bsxfun(@eq,2*primeperms(1:end)-pcheck,primeperms'));
    if numel(i)>1
        [pcheck,primeperms(i(2)),primeperms(j(2))]
    end
    
end
