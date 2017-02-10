function [ pursetemp ] = makechange( purse, coins, cointotal)

    pursetemp = purse;
    k = find(purse~=0,1,'first');
    if k==1
        pursetemp(1) = 0;
        k = find(purse(2:end)~=0,1,'first')+1;
        if isempty(k)
            done = true;
            pursetemp = purse;
        else
            done = false;
            pursetemp(k) = pursetemp(k)-1;
            k = k - 1;
        end
    else
        done = false;
        pursetemp(k) = pursetemp(k)-1;
        k = k - 1;
    end
    while ~ done
        while pursetemp*coins < cointotal
            pursetemp(k) = pursetemp(k) + 1;
        end

        if pursetemp*coins == cointotal
            done = true;
        else
            pursetemp(k) = pursetemp(k) - 1;
            k = k - 1;
        end
    end
end

