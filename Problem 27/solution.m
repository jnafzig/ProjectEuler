b = 1:999;
b = b(isprime(b));
a = -999:999;

maxconseq = 0;

for bi = b
    for ai = a
        if conseqprimes(ai,bi)>maxconseq
            maxconseq = conseqprimes(ai,bi);
            product = ai*bi;
        end
    end
end
