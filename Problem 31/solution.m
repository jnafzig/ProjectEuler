coins = [1 2 5 10 20 50 100 200]';
cointotal = 200;
Ncoins = numel(coins);
count = 0;
purse = zeros(1,Ncoins);
purse(end) = 1;


purse
count = count + 1
done = false;
while ~done
    pursenew = makechange(purse,coins,cointotal);
    if all(purse == pursenew)
        done = true;
    else
        count = count+1;
        purse = pursenew
    end
end

count