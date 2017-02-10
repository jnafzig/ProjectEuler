function [ flips] = F( a,b,c )
   

    if floor(sqrt(c))==sqrt(c)

        N = a*b*c;

        cycle = [b*c;a*c;a*b*sqrt(c)];

        slices = N;
        frosted = true;

        flips = 0;
        while ~all(frosted) || flips==0
            next = cycle(mod(flips,3)+1);

            i = find(slices==next); 
            if isempty(i)
                i = find(slices>next,1,'first');
                frosted = [frosted(i:end);~frosted(i:-1:1)];
                slices = [slices(i:end)-next;N-slices(i-1:-1:1);N];
            else
                frosted = [frosted(i+1:end);~frosted(i:-1:1)];

                slices = [slices(i+1:end)-next;N-slices(i-1:-1:1);N];
            end
            flips = flips+1;
        end

    else

        N = a*b*c;

        cycleA = [b*c;a*c;0];
        cycleB = [0;0;a*b];

        slicesA = N;
        slicesB = 0;

        frosted = true;

        flips = 0;
        while ~all(frosted) || flips==0
            nextA = cycleA(mod(flips,3)+1);
            nextB = cycleB(mod(flips,3)+1);

            i = find(slicesA==nextA & slicesB==nextB); 
            if isempty(i)
                i = find(slicesA+slicesB*sqrt(c)>nextA+nextB*sqrt(c),1,'first');
                frosted = [frosted(i:end);~frosted(i:-1:1)];
                slicesA = [slicesA(i:end)-nextA;N-slicesA(i-1:-1:1);N];
                slicesB = [slicesB(i:end)-nextB;-slicesB(i-1:-1:1);0];
            else
                frosted = [frosted(i+1:end);~frosted(i:-1:1)];

                slicesA = [slicesA(i+1:end)-nextA;N-slicesA(i-1:-1:1);N];
                slicesB = [slicesB(i+1:end)-nextB;-slicesB(i-1:-1:1);0];

            end
            flips = flips+1;
        end
    end
    
end

