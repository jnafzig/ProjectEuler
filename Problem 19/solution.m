[yearRange,monthRange] = ndgrid(1901:2000, 1:12);
sum(sum(weekday(datenum(yearRange,monthRange,1))==1))