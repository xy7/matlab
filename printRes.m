function printRes(res )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if( length(find(size(res)==3)) ~= 2 )
    'input size is not 3*3'
    return
end

allCol = sum(res);
allRow = sum(res');
all = sum(allRow);

right = 0;
for(i=1:3)
    right = right + res(i, i);
end
rightRate = right/all;
[s, errorMsg] = sprintf('all: %d, rightRate: %f ', all, rightRate);
s

resRate = [res/all];
coverRate = [ res(1,1)/allRow(1); res(2,2)/allRow(2); res(3,3)/allRow(3)];
hitRate = [ res(1,1)/allCol(1); res(2,2)/allCol(2); res(3,3)/allCol(3)];
[resRate, coverRate, hitRate]

%{
resut Matrix:
        predict_0   predict_1    predict_2  allCnt  rightRate
Target_0                                    coverRate_0  hiteRate_0
Target_1                                    coverRate_1  hiteRate_1
Target_2                                    coverRate_2  hiteRate_2
%}



