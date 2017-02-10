numerals = importdata('p089_roman.txt');

orig = sum(cellfun(@numel,numerals));
numerals = strrep(numerals,'DCCCC','CM');
numerals = strrep(numerals,'CCCC','CD');
numerals = strrep(numerals,'LXXXX','XC');
numerals = strrep(numerals,'XXXX','XL');
numerals = strrep(numerals,'VIIII','IX');
numerals = strrep(numerals,'IIII','IV');
final = sum(cellfun(@numel,numerals));

orig - final