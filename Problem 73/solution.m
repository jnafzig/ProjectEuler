n = 12000;

a = 1;
b = 3;
d = n;

while mod((d*a+1)./b,1)~=0
    d = d-1;
end

c = (d*a+1)./b;
p = c;
q = d;

N = 0;
while p/q < 1/2
    k = floor((n+b)/d);
    p = k*c-a;
    q = k*d-b;
    
    a = c; b = d; c = p; d = q; 
    N = N + 1;
end

N