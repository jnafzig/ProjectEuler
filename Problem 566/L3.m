function [ slices] = L3( a,b,c )
   
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

        sliceA0 = [N-sum(cycleA),N-sum(cycleA(2:3)),N-cycleA(3)];
        sliceB0 = [-sum(cycleB),-sum(cycleB(2:3)),-cycleB(3)];
        
        slicesA = cell(3,1);
        slicesB = cell(3,1);
        
        for j = 1:3
            
            sliceA = sliceA0(j);
            sliceB = sliceB0(j);
            
            flips = 1;
            while ~(sliceA==sliceA0(j) && sliceB==sliceB0(j)) || flips==1;
                
                slicesA{j}(flips,1) = sliceA;
                slicesB{j}(flips,1) = sliceB;               
                
                for i = 1:3
                    nextA = cycleA(i);
                    nextB = cycleB(i);

                    if sliceA+sliceB*sqrt(c)>=nextA+nextB*sqrt(c);
                        sliceA = sliceA-nextA;
                        sliceB = sliceB-nextB;
                    else
                        sliceA = N-sliceA;
                        sliceB = -sliceB;
                    end
                end
                
                flips = flips+1;
            end
        end
        slicesA = vertcat(slicesA{:});
        slicesB = vertcat(slicesB{:});
        
        slices = unique([slicesA,slicesB],'rows');
        [~,ix] = sort(slices(:,1)+slices(:,2)*sqrt(c));
        slices = slices(ix,:);
        
    end
end

