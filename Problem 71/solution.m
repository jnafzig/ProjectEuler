c = 3;
d = 7;
b = 1000000;

while mod((b*c-1)./d,1)~=0
    b = b-1;
end

(b*c-1)./d,b