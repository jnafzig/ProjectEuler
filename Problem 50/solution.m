N = 10^6;
p = primes(N);
maxconseq = 1;
while sum(p(1:maxconseq))<N
    maxconseq = maxconseq + 1;
end
maxconseq = maxconseq + 1;
 
done = false;

while ~done
    r = 0;
    maxconseq = maxconseq - 1;
    while sum(p((1:maxconseq)+r))<N
        if isprime(sum(p((1:maxconseq)+r)))
            done = true;
            lcps = sum(p((1:maxconseq)+r));
        end
            
        r = r + 1;
    end 
    
end