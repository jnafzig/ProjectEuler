
xlist = [];
for n = 2:9
    numdigits = n;
    i = 1;
    while numdigits<=9
        x = sprintf('%d',[1:n]*i);
        numdigits = numel(x);
        if numdigits==9 
            if all(sum(bsxfun(@eq,x,('123456789')'),2)==1)
                xlist = [xlist;sscanf(x,'%d')];
            end
        end
        i = i+1;
    end            
end
