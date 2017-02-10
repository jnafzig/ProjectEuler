N = int64(10^11);
d = int64(2017);


tic;
primesinit = primes(int64(sqrt(double(N))));
numberlist = int64((d-1):d:N);
candidates = sieve(numberlist(:));
primelist = ([primesinit(:);candidates(:)]);
toc;

tic;
maxpow = int64(floor(log(double(N))./log(double(primelist))));
plist = [];
alist = [];
for pow = unique(maxpow');
    primecandidates = primelist(maxpow==pow);
    match = (mod(cumsum(bsxfun(@power,primecandidates,((0:pow))),2),d)==0);

    if (sum(sum(match))>0)
        [a,p] = find(match');
        plist = [plist;primecandidates(p(:))];        
        alist = [alist;a(:)-1];
    end
end
toc;

% plist = double(plist);
% N = double(N);

% alist = double(alist);
% d = double(d);
tic;
total = 0;
Nfactors = numel(plist);
candidates = cell(1,Nfactors);
for i = 1:Nfactors;

    cap = int64(floor(double(N)/double(plist(i)^alist(i))));
    newcandidates = (1:cap).*(plist(i)^alist(i));
    if cap>=plist(i)
        newcandidates(plist(i):plist(i):end) = 0;
    end
    candidates{i} = newcandidates(newcandidates~=0);

end
toc;
candidates = [candidates{:}];
sum(unique(uint64(candidates)),'native')

% candy = unique(sort(candidates));
% list = 1:N;
% chk = list(mod(sumdivisors(list)+list,d)==0);
% int64(sum(chk))

