function [test_class, other_class, predictions, accuracy, model] = run_tests(num_keywords,n_divide,n_sec,classifier)
% classifies by keyword or name (what word is it or what person said it)
% num_keywords: 1, 2, 3, 4
% n_divide: divides data into n_divide points 
% n_sec: between 0-2 seconds
% classifier: 'keyword', 'name'

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
predictions = cell(num_keywords*20,length(permutations(:,1)));
accuracy = zeros(length(permutations(:,1)),1);

top_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc';
audio_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc\audio_trim';

%%% trim audio
num_files = 50;
Fs = ceil(44100*n_sec);
% trimwav(keywords,num_files,Fs,top_folder,audio_folder);

%%% test different combinations of words
num_record = 40; % # of audio files used for training set
test_class = cell((50-num_record)*2*num_keywords,length(permutations(:,1)));
other_class = cell((50-num_record)*2*num_keywords,length(permutations(:,1)));
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
    [test_data,test_class(:,num_permutations),other_class(:,num_permutations)] = get_set(permutations(num_permutations,1:end), ...
                                    names, num_record+1, num_files, Fs, classifier, top_folder, audio_folder);
    
    fprintf('predicting...\n');
    test_data_mean = zeros(length(test_data(:,1)),n_divide);
    for i = 1 : length(test_data(:,1))
        test_data_mean(i,:) = div_data(test_data(i,:),n_divide,2^10);
    end
    predictions(:,num_permutations) = predict(model,test_data_mean);
    accuracy(num_permutations,1) = sum(strcmp(predictions(:,num_permutations),test_class(:,num_permutations))) / length(predictions(:,num_permutations));
    
    fprintf('done.\n');
end