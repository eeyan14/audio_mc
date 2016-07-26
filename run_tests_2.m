function [acc] = run_tests_2(words,n_divide,n_sec,top_folder,audio_folder)
% classifies by 'word' and 'not word'
%   words: cell array of keywords
%   n_divide: 1-512 divisions
%   n_sec: 0-2 seconds
%   top_folder: folder with .m files
%   audio_folder: folder with audio recordings

names = {'ch_','es_'};
Fs = ceil(44100*n_sec);
num_record = 40;
num_files = 50;
acc = zeros(1,length(words));

% get training and testing data
[train_data,train_class,~] = get_set(words(1:4), names, 1, num_record, ...
                                    Fs, 'keyword', top_folder, audio_folder);
[test_data,test_class,~] = get_set(words(1:4), names, num_record+1, num_files, ...
                                    Fs, 'keyword', top_folder, audio_folder);

% divide data into n_divide subsets
train_data_mean = zeros(length(train_data(:,1)),n_divide);
for i = 1 : length(train_data(:,1))
    train_data_mean(i,:) = div_data(train_data(i,:),n_divide,2^10);
end % i
test_data_mean = zeros(length(test_data(:,1)),n_divide);
for i = 1 : length(test_data(:,1))
    test_data_mean(i,:) = div_data(test_data(i,:),n_divide,2^10);
end % i

% run ML on classifying each word
for w = 1:length(words)
    pos_train_class = strcmp(words(w),train_class);
    pos_test_class = strcmp(words(w),test_class);
    fprintf('fitting model (word %i)...\n',w);
    model = fitcsvm(train_data_mean,pos_train_class);
    fprintf('predicting...\n');
    pred = predict(model,test_data_mean);
    acc(1,w) = sum(pos_test_class==pred) / length(pred);
end
disp(acc);

end