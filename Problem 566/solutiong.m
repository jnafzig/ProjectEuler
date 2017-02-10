clear;

a = 10;
b = 14;
c = 16;

F(a,b,c)

N = 1;
for p = [a,b,sqrt(c)]
    N = lcm(N,p);
end

cycle = [N/a;N/b;N/sqrt(c)];


x = 1:N;

Nelem = N;

flipper = cell(3,1);
j = zeros(3,1);
for i = 1:3
    j(i) = find(x==cycle(i));
    flipper{i} = sparse(1:Nelem,[j(i)+1:Nelem,j(i):-1:1],[ones(1,Nelem-j(i)),-ones(1,j(i))],Nelem,Nelem);
end

flipper0 = (flipper{3}*flipper{2}*flipper{1});

X = (1:Nelem)';
O = zeros(size(X));
n = 1;
while ~all(X==0)
    if mod(n,3) == 0
        k = find(flipper0^floor(n/3)*X==X&X~=0);
    elseif mod(n,3) == 1
        k = find(flipper{1}*flipper0^floor(n/3)*X==X&X~=0);
    else
        k = find(flipper{2}*flipper{1}*flipper0^floor(n/3)*X==X&X~=0);
    end
    X(k) = 0;
    O(k) = n;
    n = n + 1;
end

for p = unique(O)'
    Y = zeros(Nelem,1);
    Y(flipper0^p*(1:Nelem)'==(1:Nelem)') = 1;
    n = 1;
    while ~all(flipper0^n*Y>0|flipper0^n*Y==0)
        n = n+1;
    end
    O(O==p)=n;
end


F = 1;
for p = unique(O)'
    F = lcm(F,p);
end
flips = F*3
