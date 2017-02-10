function [ payout ] = game()
    %GAME 
    bust = false;
    payout = 1;
    while ~bust
        if randi(2)==1
            payout = payout*2;
        else
            bust = true;
        end
    end
end

