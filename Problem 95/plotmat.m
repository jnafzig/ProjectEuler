function [ reducedmat ] = plotmat( spamat,f)
    %PLOTMAT takes a large sparse matrix and bins results into smaller full
    %matrix
    % reduce by factor of f
    
    reducedmat = accumarray([ceil(numbers'/f),ceil(chain'/f)],1,[ceil(N/f),ceil(M/f)]);
    
end

