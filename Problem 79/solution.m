m = num2str(importdata('p079_keylog.txt'));
m = unique([m(:,[1,2]);m(:,[2,3])],'rows')