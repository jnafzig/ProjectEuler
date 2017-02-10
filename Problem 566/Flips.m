function [ flips] = Flips( a,b,c )
   
    if floor(sqrt(c))==sqrt(c)

        cycle = [b*c;a*c;a*b*sqrt(c)];

        slices = L2(a,b,c);

        
        frosted = true(1,numel(slices)-1);
        Nelem = numel(frosted);

        i = find(slices==cycle(1),1);
        j = find(slices==cycle(1)+cycle(2),1);
        k = find(slices==sum(cycle),1);

        I = 1:i-1;
        J = i:j-1;
        K = j:k-1;
        L = 1:k-1;
        M = k:Nelem;
        P = [k:Nelem,i-1:-1:1,j-1:-1:i,k-1:-1:j];
        
        done = false;
        flips = 0;
        while ~done
            if any(~frosted(M))
                
                flips = flips + 3;
                frosted(L) = ~frosted(L);
                frosted = frosted(P);
                
            else
                frosted(I) = ~frosted(I);
                if all(frosted)
                    done = true;
                    totalflips = flips+1;
                end

                frosted(J) = ~frosted(J);
                if all(frosted)
                    done = true;
                    totalflips = flips+2;
                end

                frosted(K) = ~frosted(K);
                if all(frosted)
                    done = true;
                    totalflips = flips+3;
                end

                flips = flips + 3;
                frosted = frosted(P);
            end
        end
        flips = totalflips;
    else
        cycle = [b*c;a*c;0];
        cycleB = [0;0;a*b];

        slices = L3(a,b,c);

        slicesA = slices(:,1)';
        slicesB = slices(:,2)';

        frosted = true(1,numel(slicesA)-1);
        Nelem = numel(frosted);

        i = find(slicesA==cycle(1) & slicesB==cycleB(1),1);
        j = find(slicesA==cycle(1)+cycle(2) & slicesB==cycleB(1)+cycleB(2));
        k = find(slicesA==sum(cycle) & slicesB==sum(cycleB));

        K = 1:k-1;
        P = [k:Nelem,i-1:-1:1,j-1:-1:i,k-1:-1:j];


        sliceID = (1:Nelem)';
        sliceID0 = (1:Nelem)';
        period = zeros(Nelem,1);
        n = 1;
        while ~all(sliceID==0)
            sliceID(K) = -sliceID(K);
            sliceID = sliceID(P);

            msk = sliceID==sliceID0 & sliceID~=0;
            sliceID(msk) = 0;
            period(msk) = n;
            n = n + 1;
        end


        for p = unique(period)'
            Y = zeros(Nelem,1);
            Y(period==p) = 1;    
            Y(K) = -Y(K);
            Y = Y(P);

            n = 1;
            while ~all(Y>=0)
                Y(K) = -Y(K);
                Y = Y(P);
                n = n+1;
            end
            period(period==p)=n;
        end


        flips = 1;
        for p = unique(period)'
            flips = lcm(flips,p);
        end
        flips = flips*3;
    end
    
end

