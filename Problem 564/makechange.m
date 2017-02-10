function [ newpurse ] = makechange( purse )
    %MAKECHANGE
    newpurse = purse;
    k = find(purse>1,1,'first');
    if ~isempty(k)
        j = find(newpurse(1:k-1)+1<newpurse(k),1,'last');
        newpurse(j) = newpurse(j)+1;
        newpurse(k) = newpurse(k)-1;
        done = false;
        while newpurse(j)<=newpurse(k) && ~done
            i = find(newpurse(1:j-1)>0,1,'first');
            if ~isempty(i)
                if newpurse(j)+1>newpurse(k)
                    j = j-1;
                else
                    newpurse(i) = newpurse(i)-1;
                    newpurse(j) = newpurse(j)+1;
                end
            else
                done = true;
            end
        end
    end
end

