function [] = plotstuff_nm(test_names, test_keywords, predictions)
% plot...something
% http://www.mathworks.com/matlabcentral/fileexchange/35272-matlab-plot-gallery-stacked-bar-chart/content/html/Stacked_Bar_Chart.html

kw_g = strcmp(test_keywords,'google');
kw_o = strcmp(test_keywords,'okay');
kw_s = strcmp(test_keywords,'siri');
kw_w = strcmp(test_keywords,'watson');
n_ch = strcmp(test_names,'ch_');
n_es = strcmp(test_names,'es_');
correct = strcmp(predictions,test_names);
whos kw_g kw_o kw_s kw_w n_ch n_es

person1 = sum(correct(n_ch)) / sum(n_ch);
person2 = sum(correct(n_es)) / sum(n_es);
word1 = sum(correct(kw_g)) / sum(kw_g) / 2; % divide by 2 because there are 2 people
word2 = sum(correct(kw_o)) / sum(kw_o) / 2;
word3 = sum(correct(kw_s)) / sum(kw_s) / 2;
word4 = sum(correct(kw_w)) / sum(kw_w) / 2;

%bar(1:2,[word1 word2 word3 word4], 0.5, 'stack');
bar(1:2,[person1 person2]);
%legend('watson','siri','okay','google');

end
