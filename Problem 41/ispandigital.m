function [ yn ] = ispandigital( n )
    %ISPANDIGITAL 
    
    x = sprintf('%d',n);
    yn = all(sum(bsxfun(@eq,x,sprintf('%d',1:numel(x))'),2)==1);
    
end

