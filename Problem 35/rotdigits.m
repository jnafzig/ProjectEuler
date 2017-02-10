function [ M ] = rotdigits( N)
    %ROTDIGITS 
    
    M = str2double(circshift(num2str(N),[0,1]));
    
end

