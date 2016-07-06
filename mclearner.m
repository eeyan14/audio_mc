clear all
close all

keyword = {'watson','siri','okay','google'};
names = {'ch_','es_'};
% top folder
% top_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016';
top_folder = 'C:\Users\eeyan\Downloads';
% folder with data
% audio_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016\audio_trim';
audio_folder = 'C:\Users\eeyan\Downloads\audio_trim';

num_keyword = length(keyword);
num_record = 40; % number of files used for training set
num_people = length(names);
counter = 1; % csvwrite row/col are zero-indexed
points = 44100; % number of data points to use from each file

newarr = {'siri','google'};

disp('getting training set data...');
% get training set
[train_data, train_class] = get_set(newarr, names, 1, num_record);

filt_pts = 512;
train_data_mean = zeros(length(train_data(:,1)),filt_pts);
for i = 1 : length(train_data(:,1))
    train_data_mean(i,:) = div_data(train_data(i,:),filt_pts,2^10);
end

% plot(train_data_mean(1,:),'.');
% y1 = polyfit(1:filt_pts,train_data_mean(1,:),4);
% x = 1:1:filt_pts;
% y2 = polyval(y1,x);
% hold on
% plot(x,y2);
% figure
% plot(train_data_mean(end,:),'.');
% y3 = polyfit(1:filt_pts,train_data_mean(end,:),4);
% x = 1:1:filt_pts;
% y4 = polyval(y3,x);
% hold on
% plot(x,y4);

% x = 1:1:filt_pts;
% plot(x,train_data_mean(1,:),'.',x,train_data_mean(end,:),'.');
% legend('siri','google');

disp('fitting model...');
model = fitcsvm(train_data,train_class);

% get testing set
disp('getting testing set data...');
[test_data,test_class] = get_set(newarr, names, num_record+1, 50);

test_data_mean = zeros(length(test_data(:,1)),filt_pts);
for i = 1 : length(test_data(:,1))
    test_data_mean(i,:) = div_data(test_data,filt_pts,2^10);
end

disp('predicting...');
predictions = predict(model,test_data);
accuracy = sum(strcmp(predictions,test_class)) / length(predictions)
cd(top_folder);



