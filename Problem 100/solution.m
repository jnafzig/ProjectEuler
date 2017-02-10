
q = 0;
n = 1;
while q<=10^12
    p = round(1/8*(2*(3-2*sqrt(2))^n+sqrt(2)*(3-2*sqrt(2))^n+2*(3+2*sqrt(2))^n-sqrt(2)*(3+2*sqrt(2))^n+4));
    q = round(1/4*(-(3-2*sqrt(2))^n-sqrt(2)*(3-2*sqrt(2))^n-(3+2*sqrt(2))^n+sqrt(2)*(3+2*sqrt(2))^n+2));
    n = n+1;
end

fprintf('\n%d\n\n',p)