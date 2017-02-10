tol = 1e-4;
m = 2;
s = 2;
nmax = floor(-log2(tol));
n = 1:nmax;
A = sparse(2^(nmax-1),2^(nmax-1));
B = sparse(2^(nmax-1),1);
p = sparse(2^(nmax-1),1);

sout1 = s-m+2.^(n-1);
A(s,sout1(sout1<=2^(nmax-1)))=2.^(-n((sout1<=2^(nmax-1))));
B(s) = sum(2.^(-n((sout1>2^(nmax-1)))));
for s = sout1
    sout = s-m+2.^(n-1);
    msk1 = sout<=2^(nmax-1);
    msk2 = sout>=m;
    A(s,sout(msk1&msk2))=2.^(-n(msk1&msk2));
    B(s) = sum(2.^(-n(~msk1)));
end

