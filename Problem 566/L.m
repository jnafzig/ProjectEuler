function [ slices] = L( a,b,c,flip0 )
   
    if floor(sqrt(c))==sqrt(c)

        N = a*b*c;

        cycle = [b*c;a*c;a*b*sqrt(c)];
        slice = N;
        
        flips = flip0;
        while ~(slice==0)
            next = cycle(mod(flips,3)+1);

            slices(flips+1-flip0,1) = slice;
            
            if slice>=next;
                slice = slice-next;
            else
                slice = N-slice;
            end
            flips = flips+1;
        end

    else

        N = a*b*c;

        cycleA = [b*c;a*c;0];
        cycleB = [0;0;a*b];

        sliceA = N;
        sliceB = 0;
        
        flips = flip0;
        while ~(sliceA==0 && sliceB==0)
            nextA = cycleA(mod(flips,3)+1);
            nextB = cycleB(mod(flips,3)+1);

            slicesA(flips+1-flip0,1) = sliceA;
            slicesB(flips+1-flip0,1) = sliceB;
            
            if sliceA+sliceB*sqrt(c)>=nextA+nextB*sqrt(c);
                sliceA = sliceA-nextA;
                sliceB = sliceB-nextB;
            else
                sliceA = N-sliceA;
                sliceB = -sliceB;
            end
            flips = flips+1;
        end
        slices = [slicesA,slicesB];
        
    end
    flips = flips-flip0;
end

