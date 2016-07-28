function [] = plot_nm(test_names, test_keywords, predictions, n_sec)
% plot...something
% http://www.mathworks.com/matlabcentral/fileexchange/35272-matlab-plot-gallery-stacked-bar-chart/content/html/Stacked_Bar_Chart.html

% plot overall predictions
correct = [0.8375 0.8500 0.8375 0.8625 0.8625 0.9000 0.9125];
correct = correct .* 100
figure
bar(0.4:0.1:1, correct);
axis([0.3, 1.1, 0, 100]);
ylabel('Accuracy (%)');
xlabel('Length of recording (sec)');
title('Classify by person speaking');

% plot individual
kw_g = strcmp(test_keywords,'google');
kw_o = strcmp(test_keywords,'okay');
kw_s = strcmp(test_keywords,'siri');
kw_w = strcmp(test_keywords,'watson');
n_ch = strcmp(test_names,'ch_');
n_es = strcmp(test_names,'es_');
% whos kw_g kw_o kw_s kw_w n_ch n_es
num_instances = sum(kw_g & n_ch);

% # correct / # total instances
% person1 = sum(correct(n_ch)) / sum(n_ch); 
% person2 = sum(correct(n_es)) / sum(n_es);
g_ch = sum(correct(kw_g & n_ch)) / num_instances;
o_ch = sum(correct(kw_o & n_ch)) / num_instances;
s_ch = sum(correct(kw_s & n_ch)) / num_instances;
w_ch = sum(correct(kw_w & n_ch)) / num_instances;

g_es = sum(correct(kw_g & n_es)) / num_instances;
o_es = sum(correct(kw_o & n_es)) / num_instances;
s_es = sum(correct(kw_s & n_es)) / num_instances;
w_es = sum(correct(kw_w & n_es)) / num_instances;

g = [g_ch g_es]';
o = [o_ch o_es]';
s = [s_ch s_es]';
w = [w_ch w_es]';
% whos g o s w

figure
bar(1:2, [g o s w]);
set(gca,'XTickLabel',['google','okay','siri','watson']);
title('Accuracy for each word divided by person');

end
