function [ output_args ] = KNN( k )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


X0 = load('G:\MATLAB\data\samples_0.txt', '-ascii');
X1 = load('G:\MATLAB\data\samples_1.txt', '-ascii');
X2 = load('G:\MATLAB\data\samples_2.txt', '-ascii');

[m0, n0] = size(X0);
[m1, n1] = size(X1);
[m2, n2] = size(X2);

% all train and predict
%{
X = [X0;X1;X2];
Y = [zeros(m0, 1); ones(m1, 1); ones(m2, 1)*2 ];
mdl = ClassificationKNN.fit(X, Y, 'NumNeighbors', k);

lab0 = predict(mdl, X0);
right = length(find(lab0==0));

lab1 = predict(mdl, X1);
right1 = length(find(lab1==1));

lab2 = predict(mdl, X2);
right2 = length(find(lab2==2));
[s, errorMsg] = sprintf('class 0 all: %d, rightRate: %f ', m0, right/m0);
[s1, errorMsg] = sprintf('class 1 all: %d, rightRate: %f ', m1, right1/m1);
[s2, errorMsg] = sprintf('class 2 all: %d, rightRate: %f ', m2, right2/m2);
s, s1, s2
%}

% first half to train and next half to predict

m0Half = floor(m0/2);
m1Half = floor(m1/2);
m2Half = floor(m2/2);

XFront = [ X0(1:m0Half,:); X1(1:m1Half,:); X2(1:m2Half,:) ];

YFront = [zeros(m0Half, 1); ones(m1Half, 1); ones(m2Half, 1)*2 ];

mdl = ClassificationKNN.fit(XFront, YFront, 'NumNeighbors', k);
rloss = resubLoss(mdl)
cvmdl = crossval(mdl);
kloss = kfoldLoss(cvmdl)

lab0 = predict(mdl, X0(m0Half+1:m0,:));
right = length(find(lab0==0));
wrong01 = length(find(lab0==1));
wrong02 = length(find(lab0==2));

lab1 = predict(mdl,  X1(m1Half+1:m1,:));
right1 = length(find(lab1==1));
wrong10 = length(find(lab1==0));
wrong12 = length(find(lab1==2));

lab2 = predict(mdl, X2(m2Half+1:m2,:));
right2 = length(find(lab2==2));
wrong20= length(find(lab2==0));
wrong21 = length(find(lab2==1));

printRes([right, wrong01, wrong02; wrong10, right1, wrong12; wrong20, wrong21, right2])



% only condiser may and lost
%{
m0Half = floor(m0/2);
m1Half = floor(m1/2);

XFront = [ X0(1:m0Half,:); X1(1:m1Half,:) ];

YFront = [zeros(m0Half, 1); ones(m1Half, 1) ];

mdl = ClassificationKNN.fit(XFront, YFront, 'NumNeighbors', k);
rloss = resubLoss(mdl)
cvmdl = crossval(mdl);
kloss = kfoldLoss(cvmdl)

lab0 = predict(mdl, X0(m0Half+1:m0,:));
right = length(find(lab0==0));
wrong01 = length(find(lab0==1));

lab1 = predict(mdl,  X1(m1Half+1:m1,:));
right1 = length(find(lab1==1));
wrong10 = length(find(lab1==0));


printRes([right, wrong01, 0; wrong10, right1, 0; 0, 0, 0])
%}
end

% 结论： K越大，覆盖率越小，命中率越大，准确率越大, k=1时，将流失 判为 流失 和 将流失 的比例接近

