function [] = plot_kw(test_names, test_keywords, predictions)
% plot by keyword, compare if different people saying it makes it
% better/worse
% http://www.mathworks.com/matlabcentral/fileexchange/35272-matlab-plot-gallery-stacked-bar-chart/content/html/Stacked_Bar_Chart.html

if isequal(length(predictions(1,:)),6)
    labels = {'watson,siri';
             'watson,okay';
             'watson,google';
             'siri,okay';
             'siri,google';
             'okay,google'};
elseif isequal(length(predictions(1,:)),4)
    labels = {'watson,siri,okay';
             'watson,okay,google';
             'watson,siri,google';
             'siri,okay,google'};
else % num_keywords == 4
    labels = {'watson,siri,okay,google'};
end

% plot overall predictions
correct = zeros(length(predictions(1,:)),1);
for i = 1 : length(predictions(1,:))
    temp = strcmp(predictions(:,i),test_keywords(:,i));
    correct(i,1) = sum(temp) / length(predictions(:,1));
end
correct = correct .* 100;
bar(1:length(correct(:,1)), correct);
axis([0, length(correct(:,1))+1, 0, 100]);
ylabel('Accuracy (%)');
xlabel('Test #');
title('0.3 seconds, comparison of 2 words');
set(gca,'XTickLabel',labels);

% % comparison for four words
% kw_g = strcmp(test_keywords,'google');
% kw_o = strcmp(test_keywords,'okay');
% kw_s = strcmp(test_keywords,'siri');
% kw_w = strcmp(test_keywords,'watson');
% n1 = strcmp(test_names,'ch_');
% n2 = strcmp(test_names,'es_');
% correct = strcmp(predictions,test_keywords);
% % whos kw_g kw_o kw_s kw_w n_ch n_es
% 
% num_ = sum(kw_g & n1);
% 
% g_n1 = sum(correct(kw_g & n1))% / num_;
% o_n1 = sum(correct(kw_o & n1))% / num_;
% s_n1 = sum(correct(kw_s & n1))% / num_;
% w_n1 = sum(correct(kw_w & n1))% / num_;
% 
% g_n2 = sum(correct(kw_g & n2))% / num_;
% o_n2 = sum(correct(kw_o & n2))% / num_;
% s_n2 = sum(correct(kw_s & n2))% / num_;
% w_n2 = sum(correct(kw_w & n2))% / num_;
% 
% p1 = [g_n1 o_n1 s_n1 w_n1]';
% p2 = [g_n2 o_n2 s_n2 w_n2]';
% 
% bar(1:4,[p1 p2]);
% % legend('google','okay','siri','watson');

end