N = 1000;
M = 1e10;
total = 0;
for i = 1:N
    selfpower = 1;
    for j = 1:i
        selfpower = mod(selfpower*i,M);
    end
    total = mod(total + selfpower,M);
end
fprintf('\n %d\n\n',total) 