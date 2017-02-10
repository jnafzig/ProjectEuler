function [ phi ] = eulertotient( N )
    %EULER
    if N == 1
        phi = 1;
    else
        phi = round(prod(1-1./unique(factor(N)))*N);
    end
end

