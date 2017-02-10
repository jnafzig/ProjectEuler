m = importdata('p022_names.txt');
m = sort(strsplit(strrep(m{1},'"',''),','));

abcvalue = @(x) sum(upper(x))-numel(x)*64;

sum(cellfun(abcvalue,m).*(1:numel(m)))