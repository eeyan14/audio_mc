function [] = plotstuff_kw(test_names, test_keywords, predictions)
% plot by keyword, compare if different people saying it makes it
% better/worse
% http://www.mathworks.com/matlabcentral/fileexchange/35272-matlab-plot-gallery-stacked-bar-chart/content/html/Stacked_Bar_Chart.html

% comparison for four words
kw_g = strcmp(test_keywords,'google');
kw_o = strcmp(test_keywords,'okay');
kw_s = strcmp(test_keywords,'siri');
kw_w = strcmp(test_keywords,'watson');
n1 = strcmp(test_names,'ch_');
n2 = strcmp(test_names,'es_');
correct = strcmp(predictions,test_keywords);
% whos kw_g kw_o kw_s kw_w n_ch n_es

num_ = sum(kw_g & n1);

g_n1 = sum(correct(kw_g & n1))% / num_;
o_n1 = sum(correct(kw_o & n1))% / num_;
s_n1 = sum(correct(kw_s & n1))% / num_;
w_n1 = sum(correct(kw_w & n1))% / num_;

g_n2 = sum(correct(kw_g & n2))% / num_;
o_n2 = sum(correct(kw_o & n2))% / num_;
s_n2 = sum(correct(kw_s & n2))% / num_;
w_n2 = sum(correct(kw_w & n2))% / num_;

p1 = [g_n1 o_n1 s_n1 w_n1]';
p2 = [g_n2 o_n2 s_n2 w_n2]';

bar(1:4,[p1 p2]);
% legend('google','okay','siri','watson');

end