function [new]= newimage (in,cont)

new= imadjust(in,[0 1],[0.5-((cont/100)/2) 0.5+((cont/100)/2)]);

end