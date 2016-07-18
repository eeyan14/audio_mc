function [] = plotstuff_kw(test_names, test_keywords, predictions)
% plot by keyword, compare if different people saying it makes it
% better/worse
% http://www.mathworks.com/matlabcentral/fileexchange/35272-matlab-plot-gallery-stacked-bar-chart/content/html/Stacked_Bar_Chart.html

kw_g = strcmp(test_keywords,'google');
kw_o = strcmp(test_keywords,'okay');
kw_s = strcmp(test_keywords,'siri');
kw_w = strcmp(test_keywords,'watson');
n1 = strcmp(test_names,'ch_');
n2 = strcmp(test_names,'es_');
correct = strcmp(predictions,test_keywords);
whos kw_g kw_o kw_s kw_w n_ch n_es

num_ = sum(kw_g & n1);

word1_n1 = sum(correct(kw_g & n1)) / num_;
word2_n1 = sum(correct(kw_o & n1)) / num_;
word3_n1 = sum(correct(kw_s & n1)) / num_;
word4_n1 = sum(correct(kw_w & n1)) / num_;

word1_n2 = sum(correct(kw_g & n2)) / num_;
word2_n2 = sum(correct(kw_o & n2)) / num_;
word3_n2 = sum(correct(kw_s & n2)) / num_;
word4_n2 = sum(correct(kw_w & n2)) / num_;

p1 = [word1_n1 word2_n1 word3_n1 word4_n1];
p2 = [word1_n2 word2_n2 word3_n2 word4_n2];

bar(1:4,[p1 p2]);
%legend('watson','siri','okay','google');

end