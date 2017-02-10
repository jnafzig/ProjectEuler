function [ S ] = S( n )

    row = (n-3)*(n-2)/2+1:(n+3)*(n+2)/2;
    sievemask = true(size(row));
    primelist = primes(int64(sqrt(double(max(row)))));
    d = 1;
    startmod = mod(row(1),primelist);
    spacingmod = mod(d,primelist);
    [~,minv,~] = gcd(spacingmod,primelist);
    startspot = mod(-minv.*startmod,primelist)+1;
    for i = 1:numel(primelist)
        sievemask(startspot(i):primelist(i):end) = false;
    end

    row = [[row(1:n-2),0,0,0,0];...
           [row((1:n-1)+n-2),0,0,0];...
           [row((1:n)+2*n-3),0,0];...
           [row((1:n+1)+3*n-3),0];...
           [row((1:n+2)+4*n-2)]];


    sievemask = [[0,0,sievemask(1:n-2),0,0,0,0];...
                 [0,0,sievemask((1:n-1)+n-2),0,0,0];...
                 [0,0,sievemask((1:n)+2*n-3),0,0];...
                 [0,0,sievemask((1:n+1)+3*n-3),0];...
                 [0,0,sievemask((1:n+2)+4*n-2)]];



    indices = find(sievemask(3,:));
    triplet = false(size(sievemask(3,:)));

    for i = indices
        nn = [sievemask(2,i-1:i+1);sievemask(4,i-1:i+1)];
        NN = sum(sum(nn));
        if NN>=2
            triplet(i) = true; 
        elseif NN==1
            [j,k]= find(nn);
            nnn = [sievemask(3,(i-1:i+1)-2+k);sievemask(4*j-3,(i-1:i+1)-2+k)];
            if sum(sum(nnn))>=2
                triplet(i) = true;
            end
        end
    end
    
    row = int64(row);

    S = sum((row(3,triplet(3:end))),'native');

    
end

