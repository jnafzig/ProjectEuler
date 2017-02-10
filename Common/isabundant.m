function [ abundant ] = isabundant( n )
    %ISABUNDANT Check whether n is abundant
    abundant =  sumdivisors(n)>n;
    
end

