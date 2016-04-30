function plotKmeans(fileName, k) % 'G:\MATLAB\data\samples_0.txt'
if(nargin<2)
    k = 4;
end
X = load(fileName, '-ascii');
opts = statset('Display','final');
%k = 4; % specify the class numbers
[idx,ctrs] = kmeans(X, k, ...
    'Replicates', 4, ...
    'Options', opts);

size(idx);
size(ctrs);

figure('name', fileName);
hold on;

markerSize = 20;
lineWidth = 3;

colors = str2mat('r', 'm', 'g', 'c', 'b', 'y', 'k');
lc = zeros(k, 1);
for i = 1 : k
    colorShap = strcat(colors(i), ':.');
    plot(ctrs(i,:), colorShap, 'MarkerSize', markerSize,'LineWidth', lineWidth);
    num = length( find(idx==i) );
    str = num2str(num);
    lc(i, 1) = num;
end

legend(str2mat(num2str(lc)));

hold off;




   