p = primes(100);
p = [p(1:10)];
k = [3 1 1 1 1 1 1 1 1 0];
ref = prod(p);
composite = prod(p.^k);
R = composite./(composite-1)*prod(p(k>0)-1)/prod(p(k>0))
R<15499/94744
composite<ref

% N = 1:100000;
% R = arrayfun(@(x) eulertotient(x)./(x-1),N);
% 
% 
% [m,ix]=min(R)