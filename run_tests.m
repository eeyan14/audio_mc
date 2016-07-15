function [test_class, other_class, predictions, accuracy, model] = run_tests(num_keywords,n_divide,n_sec)
% runs various tests
% num_keywords: 1, 2, 3, 4
% n_divide: divides data into n_divide points 
% n_sec: between 0-2 seconds

if isequal(num_keywords,2)
    permutations = {'watson','siri';
                    'watson','okay';
                    'watson','google';
                    'siri','okay';
                    'siri','google';
                    'okay','google'};
    
elseif isequal(num_keywords,3)
    permutations = {'watson','siri','okay';
                    'watson','okay','google';
                    'watson','siri','google';
                    'siri','okay','google'};
else % num_keywords == 4
    permutations = {'watson','siri','okay','google'};
end
names = {'ch_','es_'};
accuracy = zeros(length(permutations(:,1)),1);

top_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc';
audio_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc\audio_trim';

%%% trim audio
num_files = 50;
Fs = 44100*n_sec;
% trimwav(keywords,num_files,Fs,top_folder,audio_folder);

%%% test different combinations of words
num_record = 40; % # of audio files used for training set
classifier = 'name';
for num_permutations = 1:length(permutations(:,1))
    fprintf('getting training data for keywords:');
    disp(permutations(num_permutations,1:end));
    [train_data,train_class,~] = get_set(permutations(num_permutations,1:end), names, 1, ...
                                       num_record, Fs, classifier, top_folder, audio_folder);

    fprintf('fitting model...\n');
    train_data_mean = zeros(length(train_data(:,1)),n_divide);
    for i = 1 : length(train_data(:,1))
        train_data_mean(i,:) = div_data(train_data(i,:),n_divide,2^10);
    end % i
    model = fitcecoc(train_data_mean,train_class);
    
    fprintf('getting testing data for keywords:');
    disp(permutations(num_permutations,1:end));
    [test_data,test_class,other_class] = get_set(permutations(num_permutations,1:end), names, num_record+1,...
                                     num_files, Fs, classifier, top_folder, audio_folder);
    
    fprintf('predicting...\n');
    test_data_mean = zeros(length(test_data(:,1)),n_divide);
    for i = 1 : length(test_data(:,1))
        test_data_mean(i,:) = div_data(test_data(i,:),n_divide,2^10);
    end
    predictions = predict(model,test_data_mean);
    accuracy(num_permutations,1) = sum(strcmp(predictions,test_class)) / length(predictions);
    
    % fprintf('accuracy: %f\n\n',accuracy);
    
    %%% plot things?
%     train_data_comb = combine_words(train_data_mean);
%     figure
%     boxplot(train_data_comb(1:end,:));
%     title(permutations(num_permutations,1:2));
%     figure
%     boxplot(train_data_mean(end/2:end,:));
%     title(permutations(num_permutations,2));
    
    fprintf('done.\n');
end