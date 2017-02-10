perimeters = zeros(1000,1);
for i = 2:25
    for j = i:-1:1
        if gcd(i,j)==1 && (mod(i,2)==0 || mod(j,2)==0)
            a = i^2-j^2;
            b = 2*i*j;
            c = i^2+j^2;
            p = a + b + c;
            if p <=1000
                perimeters(p:p:1000) = perimeters(p:p:1000) + 1;
            end
        end
    end
end

