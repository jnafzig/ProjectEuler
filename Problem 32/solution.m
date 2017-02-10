plist = [];
ilist = [];
jlist = [];
for i = 1:10000
    for j = 1:50
        p = i*j;
        x = sprintf('%d%d%d',i,j,p);
        if numel(x)==9 
            if all(sum(bsxfun(@eq,x,('123456789')'),2)==1)
                ilist = [ilist;i];
                jlist = [jlist;j];
                plist = [plist;p];
            end
        end
            
    end
end

 [ilist,jlist,plist]
 sum(unique(plist))