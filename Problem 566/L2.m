function [ slices] = L2( a,b,c )
   
    if floor(sqrt(c))==sqrt(c)

        N = a*b*c;

        cycle = [b*c;a*c;a*b*sqrt(c)];

        slices = [0,N];
        
        flips = 0;
        done = false;
        while ~done

            done = true;
            i = find(slices==cycle(1),1);
            if isempty(i)
                msk = slices>cycle(1);
                slices = [slices(~msk),cycle(1),slices(msk)];
                i = find(msk,1);
                done = false;
            end

            j = find(slices==cycle(1)+cycle(2),1);
            if isempty(j)
                msk = slices > cycle(1)+cycle(2);
                slices = [slices(~msk),cycle(1)+cycle(2),slices(msk)];
                j = find(msk,1);
                done = false;
            end
            k = find(slices==sum(cycle));
            if isempty(k)
                msk = slices > sum(cycle);
                slices = [slices(~msk),sum(cycle),slices(msk)];
                k = find(msk,1);
                done = false;
            end
            
            slices = [slices(k:end-1)-sum(cycle),...
                N-slices(i:-1:2)-sum(cycle(2:3)),...
                N-slices(j:-1:i+1)+cycle(1)-cycle(3),...
                N-slices(k:-1:j+1)+sum(cycle(1:2)),N];

            flips = flips+1;
        end
        slices = slices';
    else
        N = a*b*c;

        cycleA = [b*c;a*c;0];
        cycleB = [0;0;a*b];

        slicesA = [0,N];
        slicesB = [0,0];

        flips = 0;
        done = false;
        while ~done

            done = true;
            i = find(slicesA==cycleA(1) & slicesB==cycleB(1),1);
            if isempty(i)
                msk = slicesA+slicesB*sqrt(c)>cycleA(1)+cycleB(1)*sqrt(c);
                slicesA = [slicesA(~msk),cycleA(1),slicesA(msk)];
                slicesB = [slicesB(~msk),cycleB(1),slicesB(msk)];
                i = find(msk,1);
                done = false;
            end

            j = find(slicesA==cycleA(1)+cycleA(2) & slicesB==cycleB(1)+cycleB(2));
            if isempty(j)
                msk = slicesA+slicesB*sqrt(c) > ...
                    cycleA(1)+cycleA(2)+(cycleB(1)+cycleB(1))*sqrt(c);
                slicesA = [slicesA(~msk),cycleA(1)+cycleA(2),slicesA(msk)];
                slicesB = [slicesB(~msk),cycleB(1)+cycleB(2),slicesB(msk)];
                j = find(msk,1);
                done = false;
            end
            k = find(slicesA==sum(cycleA) & slicesB==sum(cycleB));
            if isempty(k)
                msk = slicesA+slicesB*sqrt(c) > ...
                    sum(cycleA)+sum(cycleB)*sqrt(c);
                slicesA = [slicesA(~msk),sum(cycleA),slicesA(msk)];
                slicesB = [slicesB(~msk),sum(cycleB),slicesB(msk)];
                k = find(msk,1);
                done = false;
            end
            
            slicesA = [slicesA(k:end-1)-sum(cycleA),...
                N-slicesA(i:-1:2)-sum(cycleA(2:3)),...
                N-slicesA(j:-1:i+1)+cycleA(1)-cycleA(3),...
                N-slicesA(k:-1:j+1)+sum(cycleA(1:2)),N];

            slicesB = [slicesB(k:end-1)-sum(cycleB),...
                -slicesB(i:-1:2)-sum(cycleB(2:3)),...
                -slicesB(j:-1:i+1)+cycleB(1)-cycleB(3),...
                -slicesB(k:-1:j+1)+sum(cycleB(1:2)),0];

            flips = flips+1;
        end
        
        slices = [slicesA',slicesB'];
    end
end

