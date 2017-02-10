m = importdata('p042_words.txt');
m = sort(strsplit(strrep(m{1},'"',''),','));

abcvalue = @(x) sum(upper(x))-numel(x)*64;

sum(mod(sqrt(cellfun(abcvalue,m)*8+1),1)==0)